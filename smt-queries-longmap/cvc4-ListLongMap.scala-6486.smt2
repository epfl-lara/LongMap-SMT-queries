; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82760 () Bool)

(assert start!82760)

(declare-fun b_free!18893 () Bool)

(declare-fun b_next!18893 () Bool)

(assert (=> start!82760 (= b_free!18893 (not b_next!18893))))

(declare-fun tp!65799 () Bool)

(declare-fun b_and!30381 () Bool)

(assert (=> start!82760 (= tp!65799 b_and!30381)))

(declare-fun b!965300 () Bool)

(declare-fun res!646150 () Bool)

(declare-fun e!544164 () Bool)

(assert (=> b!965300 (=> (not res!646150) (not e!544164))))

(declare-datatypes ((array!59475 0))(
  ( (array!59476 (arr!28606 (Array (_ BitVec 32) (_ BitVec 64))) (size!29085 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59475)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965300 (= res!646150 (validKeyInArray!0 (select (arr!28606 _keys!1686) i!803)))))

(declare-fun b!965301 () Bool)

(declare-fun res!646149 () Bool)

(assert (=> b!965301 (=> (not res!646149) (not e!544164))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59475 (_ BitVec 32)) Bool)

(assert (=> b!965301 (= res!646149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965302 () Bool)

(declare-fun e!544162 () Bool)

(declare-fun tp_is_empty!21695 () Bool)

(assert (=> b!965302 (= e!544162 tp_is_empty!21695)))

(declare-fun res!646148 () Bool)

(assert (=> start!82760 (=> (not res!646148) (not e!544164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82760 (= res!646148 (validMask!0 mask!2110))))

(assert (=> start!82760 e!544164))

(assert (=> start!82760 true))

(declare-datatypes ((V!33909 0))(
  ( (V!33910 (val!10898 Int)) )
))
(declare-datatypes ((ValueCell!10366 0))(
  ( (ValueCellFull!10366 (v!13456 V!33909)) (EmptyCell!10366) )
))
(declare-datatypes ((array!59477 0))(
  ( (array!59478 (arr!28607 (Array (_ BitVec 32) ValueCell!10366)) (size!29086 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59477)

(declare-fun e!544166 () Bool)

(declare-fun array_inv!22153 (array!59477) Bool)

(assert (=> start!82760 (and (array_inv!22153 _values!1400) e!544166)))

(declare-fun array_inv!22154 (array!59475) Bool)

(assert (=> start!82760 (array_inv!22154 _keys!1686)))

(assert (=> start!82760 tp!65799))

(assert (=> start!82760 tp_is_empty!21695))

(declare-fun b!965303 () Bool)

(assert (=> b!965303 (= e!544164 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33909)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431224 () Bool)

(declare-fun zeroValue!1342 () V!33909)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14012 0))(
  ( (tuple2!14013 (_1!7017 (_ BitVec 64)) (_2!7017 V!33909)) )
))
(declare-datatypes ((List!19856 0))(
  ( (Nil!19853) (Cons!19852 (h!21014 tuple2!14012) (t!28219 List!19856)) )
))
(declare-datatypes ((ListLongMap!12709 0))(
  ( (ListLongMap!12710 (toList!6370 List!19856)) )
))
(declare-fun contains!5473 (ListLongMap!12709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3603 (array!59475 array!59477 (_ BitVec 32) (_ BitVec 32) V!33909 V!33909 (_ BitVec 32) Int) ListLongMap!12709)

(assert (=> b!965303 (= lt!431224 (contains!5473 (getCurrentListMap!3603 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28606 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34537 () Bool)

(declare-fun mapRes!34537 () Bool)

(assert (=> mapIsEmpty!34537 mapRes!34537))

(declare-fun b!965304 () Bool)

(declare-fun res!646146 () Bool)

(assert (=> b!965304 (=> (not res!646146) (not e!544164))))

(assert (=> b!965304 (= res!646146 (and (= (size!29086 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29085 _keys!1686) (size!29086 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34537 () Bool)

(declare-fun tp!65798 () Bool)

(declare-fun e!544163 () Bool)

(assert (=> mapNonEmpty!34537 (= mapRes!34537 (and tp!65798 e!544163))))

(declare-fun mapKey!34537 () (_ BitVec 32))

(declare-fun mapRest!34537 () (Array (_ BitVec 32) ValueCell!10366))

(declare-fun mapValue!34537 () ValueCell!10366)

(assert (=> mapNonEmpty!34537 (= (arr!28607 _values!1400) (store mapRest!34537 mapKey!34537 mapValue!34537))))

(declare-fun b!965305 () Bool)

(declare-fun res!646147 () Bool)

(assert (=> b!965305 (=> (not res!646147) (not e!544164))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965305 (= res!646147 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29085 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29085 _keys!1686))))))

(declare-fun b!965306 () Bool)

(assert (=> b!965306 (= e!544163 tp_is_empty!21695)))

(declare-fun b!965307 () Bool)

(assert (=> b!965307 (= e!544166 (and e!544162 mapRes!34537))))

(declare-fun condMapEmpty!34537 () Bool)

(declare-fun mapDefault!34537 () ValueCell!10366)

