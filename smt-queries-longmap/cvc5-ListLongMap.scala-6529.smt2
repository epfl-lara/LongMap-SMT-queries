; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83058 () Bool)

(assert start!83058)

(declare-fun mapNonEmpty!34933 () Bool)

(declare-fun mapRes!34933 () Bool)

(declare-fun tp!66501 () Bool)

(declare-fun e!546184 () Bool)

(assert (=> mapNonEmpty!34933 (= mapRes!34933 (and tp!66501 e!546184))))

(declare-datatypes ((V!34249 0))(
  ( (V!34250 (val!11025 Int)) )
))
(declare-datatypes ((ValueCell!10493 0))(
  ( (ValueCellFull!10493 (v!13584 V!34249)) (EmptyCell!10493) )
))
(declare-datatypes ((array!59971 0))(
  ( (array!59972 (arr!28849 (Array (_ BitVec 32) ValueCell!10493)) (size!29328 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59971)

(declare-fun mapRest!34933 () (Array (_ BitVec 32) ValueCell!10493))

(declare-fun mapKey!34933 () (_ BitVec 32))

(declare-fun mapValue!34933 () ValueCell!10493)

(assert (=> mapNonEmpty!34933 (= (arr!28849 _values!1425) (store mapRest!34933 mapKey!34933 mapValue!34933))))

(declare-fun b!968966 () Bool)

(declare-fun res!648604 () Bool)

(declare-fun e!546181 () Bool)

(assert (=> b!968966 (=> (not res!648604) (not e!546181))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59973 0))(
  ( (array!59974 (arr!28850 (Array (_ BitVec 32) (_ BitVec 64))) (size!29329 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59973)

(assert (=> b!968966 (= res!648604 (and (= (size!29328 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29329 _keys!1717) (size!29328 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968967 () Bool)

(declare-fun tp_is_empty!21949 () Bool)

(assert (=> b!968967 (= e!546184 tp_is_empty!21949)))

(declare-fun mapIsEmpty!34933 () Bool)

(assert (=> mapIsEmpty!34933 mapRes!34933))

(declare-fun b!968968 () Bool)

(declare-fun res!648606 () Bool)

(assert (=> b!968968 (=> (not res!648606) (not e!546181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59973 (_ BitVec 32)) Bool)

(assert (=> b!968968 (= res!648606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968970 () Bool)

(declare-fun e!546183 () Bool)

(assert (=> b!968970 (= e!546183 tp_is_empty!21949)))

(declare-fun b!968971 () Bool)

(assert (=> b!968971 (= e!546181 false)))

(declare-fun lt!431573 () Bool)

(declare-datatypes ((List!20009 0))(
  ( (Nil!20006) (Cons!20005 (h!21167 (_ BitVec 64)) (t!28372 List!20009)) )
))
(declare-fun arrayNoDuplicates!0 (array!59973 (_ BitVec 32) List!20009) Bool)

(assert (=> b!968971 (= lt!431573 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20006))))

(declare-fun b!968969 () Bool)

(declare-fun e!546180 () Bool)

(assert (=> b!968969 (= e!546180 (and e!546183 mapRes!34933))))

(declare-fun condMapEmpty!34933 () Bool)

(declare-fun mapDefault!34933 () ValueCell!10493)

