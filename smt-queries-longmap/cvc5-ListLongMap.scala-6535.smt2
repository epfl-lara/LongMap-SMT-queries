; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83094 () Bool)

(assert start!83094)

(declare-fun b!969290 () Bool)

(declare-fun e!546452 () Bool)

(declare-fun tp_is_empty!21985 () Bool)

(assert (=> b!969290 (= e!546452 tp_is_empty!21985)))

(declare-fun b!969291 () Bool)

(declare-fun e!546450 () Bool)

(assert (=> b!969291 (= e!546450 tp_is_empty!21985)))

(declare-fun b!969292 () Bool)

(declare-fun res!648767 () Bool)

(declare-fun e!546453 () Bool)

(assert (=> b!969292 (=> (not res!648767) (not e!546453))))

(declare-datatypes ((array!60037 0))(
  ( (array!60038 (arr!28882 (Array (_ BitVec 32) (_ BitVec 64))) (size!29361 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60037)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60037 (_ BitVec 32)) Bool)

(assert (=> b!969292 (= res!648767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969293 () Bool)

(assert (=> b!969293 (= e!546453 false)))

(declare-fun lt!431627 () Bool)

(declare-datatypes ((List!20022 0))(
  ( (Nil!20019) (Cons!20018 (h!21180 (_ BitVec 64)) (t!28385 List!20022)) )
))
(declare-fun arrayNoDuplicates!0 (array!60037 (_ BitVec 32) List!20022) Bool)

(assert (=> b!969293 (= lt!431627 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20019))))

(declare-fun mapIsEmpty!34987 () Bool)

(declare-fun mapRes!34987 () Bool)

(assert (=> mapIsEmpty!34987 mapRes!34987))

(declare-fun mapNonEmpty!34987 () Bool)

(declare-fun tp!66555 () Bool)

(assert (=> mapNonEmpty!34987 (= mapRes!34987 (and tp!66555 e!546452))))

(declare-datatypes ((V!34297 0))(
  ( (V!34298 (val!11043 Int)) )
))
(declare-datatypes ((ValueCell!10511 0))(
  ( (ValueCellFull!10511 (v!13602 V!34297)) (EmptyCell!10511) )
))
(declare-fun mapValue!34987 () ValueCell!10511)

(declare-datatypes ((array!60039 0))(
  ( (array!60040 (arr!28883 (Array (_ BitVec 32) ValueCell!10511)) (size!29362 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60039)

(declare-fun mapRest!34987 () (Array (_ BitVec 32) ValueCell!10511))

(declare-fun mapKey!34987 () (_ BitVec 32))

(assert (=> mapNonEmpty!34987 (= (arr!28883 _values!1425) (store mapRest!34987 mapKey!34987 mapValue!34987))))

(declare-fun b!969295 () Bool)

(declare-fun res!648768 () Bool)

(assert (=> b!969295 (=> (not res!648768) (not e!546453))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969295 (= res!648768 (and (= (size!29362 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29361 _keys!1717) (size!29362 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648766 () Bool)

(assert (=> start!83094 (=> (not res!648766) (not e!546453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83094 (= res!648766 (validMask!0 mask!2147))))

(assert (=> start!83094 e!546453))

(assert (=> start!83094 true))

(declare-fun e!546454 () Bool)

(declare-fun array_inv!22359 (array!60039) Bool)

(assert (=> start!83094 (and (array_inv!22359 _values!1425) e!546454)))

(declare-fun array_inv!22360 (array!60037) Bool)

(assert (=> start!83094 (array_inv!22360 _keys!1717)))

(declare-fun b!969294 () Bool)

(assert (=> b!969294 (= e!546454 (and e!546450 mapRes!34987))))

(declare-fun condMapEmpty!34987 () Bool)

(declare-fun mapDefault!34987 () ValueCell!10511)

