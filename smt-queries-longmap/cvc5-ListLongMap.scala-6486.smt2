; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82756 () Bool)

(assert start!82756)

(declare-fun b_free!18889 () Bool)

(declare-fun b_next!18889 () Bool)

(assert (=> start!82756 (= b_free!18889 (not b_next!18889))))

(declare-fun tp!65787 () Bool)

(declare-fun b_and!30377 () Bool)

(assert (=> start!82756 (= tp!65787 b_and!30377)))

(declare-fun b!965247 () Bool)

(declare-fun res!646113 () Bool)

(declare-fun e!544132 () Bool)

(assert (=> b!965247 (=> (not res!646113) (not e!544132))))

(declare-datatypes ((array!59467 0))(
  ( (array!59468 (arr!28602 (Array (_ BitVec 32) (_ BitVec 64))) (size!29081 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59467)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965247 (= res!646113 (validKeyInArray!0 (select (arr!28602 _keys!1686) i!803)))))

(declare-fun b!965248 () Bool)

(declare-fun e!544135 () Bool)

(declare-fun tp_is_empty!21691 () Bool)

(assert (=> b!965248 (= e!544135 tp_is_empty!21691)))

(declare-fun mapIsEmpty!34531 () Bool)

(declare-fun mapRes!34531 () Bool)

(assert (=> mapIsEmpty!34531 mapRes!34531))

(declare-fun b!965249 () Bool)

(declare-fun res!646111 () Bool)

(assert (=> b!965249 (=> (not res!646111) (not e!544132))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965249 (= res!646111 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29081 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29081 _keys!1686))))))

(declare-fun b!965250 () Bool)

(declare-fun res!646109 () Bool)

(assert (=> b!965250 (=> (not res!646109) (not e!544132))))

(declare-datatypes ((List!19852 0))(
  ( (Nil!19849) (Cons!19848 (h!21010 (_ BitVec 64)) (t!28215 List!19852)) )
))
(declare-fun arrayNoDuplicates!0 (array!59467 (_ BitVec 32) List!19852) Bool)

(assert (=> b!965250 (= res!646109 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19849))))

(declare-fun b!965251 () Bool)

(declare-fun res!646114 () Bool)

(assert (=> b!965251 (=> (not res!646114) (not e!544132))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59467 (_ BitVec 32)) Bool)

(assert (=> b!965251 (= res!646114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965252 () Bool)

(declare-fun e!544133 () Bool)

(assert (=> b!965252 (= e!544133 tp_is_empty!21691)))

(declare-fun b!965253 () Bool)

(declare-fun res!646112 () Bool)

(assert (=> b!965253 (=> (not res!646112) (not e!544132))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33905 0))(
  ( (V!33906 (val!10896 Int)) )
))
(declare-datatypes ((ValueCell!10364 0))(
  ( (ValueCellFull!10364 (v!13454 V!33905)) (EmptyCell!10364) )
))
(declare-datatypes ((array!59469 0))(
  ( (array!59470 (arr!28603 (Array (_ BitVec 32) ValueCell!10364)) (size!29082 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59469)

(assert (=> b!965253 (= res!646112 (and (= (size!29082 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29081 _keys!1686) (size!29082 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34531 () Bool)

(declare-fun tp!65786 () Bool)

(assert (=> mapNonEmpty!34531 (= mapRes!34531 (and tp!65786 e!544135))))

(declare-fun mapRest!34531 () (Array (_ BitVec 32) ValueCell!10364))

(declare-fun mapKey!34531 () (_ BitVec 32))

(declare-fun mapValue!34531 () ValueCell!10364)

(assert (=> mapNonEmpty!34531 (= (arr!28603 _values!1400) (store mapRest!34531 mapKey!34531 mapValue!34531))))

(declare-fun b!965254 () Bool)

(assert (=> b!965254 (= e!544132 false)))

(declare-fun lt!431218 () Bool)

(declare-fun minValue!1342 () V!33905)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33905)

(declare-datatypes ((tuple2!14008 0))(
  ( (tuple2!14009 (_1!7015 (_ BitVec 64)) (_2!7015 V!33905)) )
))
(declare-datatypes ((List!19853 0))(
  ( (Nil!19850) (Cons!19849 (h!21011 tuple2!14008) (t!28216 List!19853)) )
))
(declare-datatypes ((ListLongMap!12705 0))(
  ( (ListLongMap!12706 (toList!6368 List!19853)) )
))
(declare-fun contains!5471 (ListLongMap!12705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3601 (array!59467 array!59469 (_ BitVec 32) (_ BitVec 32) V!33905 V!33905 (_ BitVec 32) Int) ListLongMap!12705)

(assert (=> b!965254 (= lt!431218 (contains!5471 (getCurrentListMap!3601 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28602 _keys!1686) i!803)))))

(declare-fun b!965246 () Bool)

(declare-fun e!544134 () Bool)

(assert (=> b!965246 (= e!544134 (and e!544133 mapRes!34531))))

(declare-fun condMapEmpty!34531 () Bool)

(declare-fun mapDefault!34531 () ValueCell!10364)

