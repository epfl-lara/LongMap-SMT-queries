; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83074 () Bool)

(assert start!83074)

(declare-fun mapNonEmpty!34957 () Bool)

(declare-fun mapRes!34957 () Bool)

(declare-fun tp!66525 () Bool)

(declare-fun e!546303 () Bool)

(assert (=> mapNonEmpty!34957 (= mapRes!34957 (and tp!66525 e!546303))))

(declare-datatypes ((V!34269 0))(
  ( (V!34270 (val!11033 Int)) )
))
(declare-datatypes ((ValueCell!10501 0))(
  ( (ValueCellFull!10501 (v!13592 V!34269)) (EmptyCell!10501) )
))
(declare-fun mapValue!34957 () ValueCell!10501)

(declare-datatypes ((array!60003 0))(
  ( (array!60004 (arr!28865 (Array (_ BitVec 32) ValueCell!10501)) (size!29344 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60003)

(declare-fun mapRest!34957 () (Array (_ BitVec 32) ValueCell!10501))

(declare-fun mapKey!34957 () (_ BitVec 32))

(assert (=> mapNonEmpty!34957 (= (arr!28865 _values!1425) (store mapRest!34957 mapKey!34957 mapValue!34957))))

(declare-fun mapIsEmpty!34957 () Bool)

(assert (=> mapIsEmpty!34957 mapRes!34957))

(declare-fun b!969111 () Bool)

(declare-fun e!546300 () Bool)

(assert (=> b!969111 (= e!546300 false)))

(declare-fun lt!431597 () Bool)

(declare-datatypes ((array!60005 0))(
  ( (array!60006 (arr!28866 (Array (_ BitVec 32) (_ BitVec 64))) (size!29345 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60005)

(declare-datatypes ((List!20016 0))(
  ( (Nil!20013) (Cons!20012 (h!21174 (_ BitVec 64)) (t!28379 List!20016)) )
))
(declare-fun arrayNoDuplicates!0 (array!60005 (_ BitVec 32) List!20016) Bool)

(assert (=> b!969111 (= lt!431597 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20013))))

(declare-fun b!969112 () Bool)

(declare-fun res!648676 () Bool)

(assert (=> b!969112 (=> (not res!648676) (not e!546300))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969112 (= res!648676 (and (= (size!29344 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29345 _keys!1717) (size!29344 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969113 () Bool)

(declare-fun res!648678 () Bool)

(assert (=> b!969113 (=> (not res!648678) (not e!546300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60005 (_ BitVec 32)) Bool)

(assert (=> b!969113 (= res!648678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969114 () Bool)

(declare-fun e!546302 () Bool)

(declare-fun tp_is_empty!21965 () Bool)

(assert (=> b!969114 (= e!546302 tp_is_empty!21965)))

(declare-fun b!969115 () Bool)

(assert (=> b!969115 (= e!546303 tp_is_empty!21965)))

(declare-fun res!648677 () Bool)

(assert (=> start!83074 (=> (not res!648677) (not e!546300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83074 (= res!648677 (validMask!0 mask!2147))))

(assert (=> start!83074 e!546300))

(assert (=> start!83074 true))

(declare-fun e!546304 () Bool)

(declare-fun array_inv!22347 (array!60003) Bool)

(assert (=> start!83074 (and (array_inv!22347 _values!1425) e!546304)))

(declare-fun array_inv!22348 (array!60005) Bool)

(assert (=> start!83074 (array_inv!22348 _keys!1717)))

(declare-fun b!969110 () Bool)

(assert (=> b!969110 (= e!546304 (and e!546302 mapRes!34957))))

(declare-fun condMapEmpty!34957 () Bool)

(declare-fun mapDefault!34957 () ValueCell!10501)

