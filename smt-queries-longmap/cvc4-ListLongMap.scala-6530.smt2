; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83068 () Bool)

(assert start!83068)

(declare-fun b!969056 () Bool)

(declare-fun e!546256 () Bool)

(assert (=> b!969056 (= e!546256 false)))

(declare-fun lt!431588 () Bool)

(declare-datatypes ((array!59991 0))(
  ( (array!59992 (arr!28859 (Array (_ BitVec 32) (_ BitVec 64))) (size!29338 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59991)

(declare-datatypes ((List!20013 0))(
  ( (Nil!20010) (Cons!20009 (h!21171 (_ BitVec 64)) (t!28376 List!20013)) )
))
(declare-fun arrayNoDuplicates!0 (array!59991 (_ BitVec 32) List!20013) Bool)

(assert (=> b!969056 (= lt!431588 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20010))))

(declare-fun b!969057 () Bool)

(declare-fun e!546255 () Bool)

(declare-fun tp_is_empty!21959 () Bool)

(assert (=> b!969057 (= e!546255 tp_is_empty!21959)))

(declare-fun mapNonEmpty!34948 () Bool)

(declare-fun mapRes!34948 () Bool)

(declare-fun tp!66516 () Bool)

(declare-fun e!546257 () Bool)

(assert (=> mapNonEmpty!34948 (= mapRes!34948 (and tp!66516 e!546257))))

(declare-datatypes ((V!34261 0))(
  ( (V!34262 (val!11030 Int)) )
))
(declare-datatypes ((ValueCell!10498 0))(
  ( (ValueCellFull!10498 (v!13589 V!34261)) (EmptyCell!10498) )
))
(declare-datatypes ((array!59993 0))(
  ( (array!59994 (arr!28860 (Array (_ BitVec 32) ValueCell!10498)) (size!29339 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59993)

(declare-fun mapValue!34948 () ValueCell!10498)

(declare-fun mapRest!34948 () (Array (_ BitVec 32) ValueCell!10498))

(declare-fun mapKey!34948 () (_ BitVec 32))

(assert (=> mapNonEmpty!34948 (= (arr!28860 _values!1425) (store mapRest!34948 mapKey!34948 mapValue!34948))))

(declare-fun res!648650 () Bool)

(assert (=> start!83068 (=> (not res!648650) (not e!546256))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83068 (= res!648650 (validMask!0 mask!2147))))

(assert (=> start!83068 e!546256))

(assert (=> start!83068 true))

(declare-fun e!546259 () Bool)

(declare-fun array_inv!22341 (array!59993) Bool)

(assert (=> start!83068 (and (array_inv!22341 _values!1425) e!546259)))

(declare-fun array_inv!22342 (array!59991) Bool)

(assert (=> start!83068 (array_inv!22342 _keys!1717)))

(declare-fun b!969058 () Bool)

(declare-fun res!648649 () Bool)

(assert (=> b!969058 (=> (not res!648649) (not e!546256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59991 (_ BitVec 32)) Bool)

(assert (=> b!969058 (= res!648649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969059 () Bool)

(assert (=> b!969059 (= e!546257 tp_is_empty!21959)))

(declare-fun b!969060 () Bool)

(declare-fun res!648651 () Bool)

(assert (=> b!969060 (=> (not res!648651) (not e!546256))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969060 (= res!648651 (and (= (size!29339 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29338 _keys!1717) (size!29339 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969061 () Bool)

(assert (=> b!969061 (= e!546259 (and e!546255 mapRes!34948))))

(declare-fun condMapEmpty!34948 () Bool)

(declare-fun mapDefault!34948 () ValueCell!10498)

