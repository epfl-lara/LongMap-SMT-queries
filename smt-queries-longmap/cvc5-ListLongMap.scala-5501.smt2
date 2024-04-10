; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72790 () Bool)

(assert start!72790)

(declare-fun mapNonEmpty!25361 () Bool)

(declare-fun mapRes!25361 () Bool)

(declare-fun tp!48679 () Bool)

(declare-fun e!471545 () Bool)

(assert (=> mapNonEmpty!25361 (= mapRes!25361 (and tp!48679 e!471545))))

(declare-datatypes ((V!26169 0))(
  ( (V!26170 (val!7968 Int)) )
))
(declare-datatypes ((ValueCell!7481 0))(
  ( (ValueCellFull!7481 (v!10393 V!26169)) (EmptyCell!7481) )
))
(declare-fun mapValue!25361 () ValueCell!7481)

(declare-fun mapKey!25361 () (_ BitVec 32))

(declare-fun mapRest!25361 () (Array (_ BitVec 32) ValueCell!7481))

(declare-datatypes ((array!47908 0))(
  ( (array!47909 (arr!22985 (Array (_ BitVec 32) ValueCell!7481)) (size!23425 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47908)

(assert (=> mapNonEmpty!25361 (= (arr!22985 _values!688) (store mapRest!25361 mapKey!25361 mapValue!25361))))

(declare-fun mapIsEmpty!25361 () Bool)

(assert (=> mapIsEmpty!25361 mapRes!25361))

(declare-fun b!844760 () Bool)

(declare-fun e!471543 () Bool)

(declare-fun tp_is_empty!15841 () Bool)

(assert (=> b!844760 (= e!471543 tp_is_empty!15841)))

(declare-fun b!844761 () Bool)

(assert (=> b!844761 (= e!471545 tp_is_empty!15841)))

(declare-fun res!573915 () Bool)

(declare-fun e!471547 () Bool)

(assert (=> start!72790 (=> (not res!573915) (not e!471547))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47910 0))(
  ( (array!47911 (arr!22986 (Array (_ BitVec 32) (_ BitVec 64))) (size!23426 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47910)

(assert (=> start!72790 (= res!573915 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23426 _keys!868))))))

(assert (=> start!72790 e!471547))

(assert (=> start!72790 true))

(declare-fun array_inv!18274 (array!47910) Bool)

(assert (=> start!72790 (array_inv!18274 _keys!868)))

(declare-fun e!471546 () Bool)

(declare-fun array_inv!18275 (array!47908) Bool)

(assert (=> start!72790 (and (array_inv!18275 _values!688) e!471546)))

(declare-fun b!844762 () Bool)

(assert (=> b!844762 (= e!471547 false)))

(declare-fun lt!381328 () Bool)

(declare-datatypes ((List!16283 0))(
  ( (Nil!16280) (Cons!16279 (h!17410 (_ BitVec 64)) (t!22654 List!16283)) )
))
(declare-fun arrayNoDuplicates!0 (array!47910 (_ BitVec 32) List!16283) Bool)

(assert (=> b!844762 (= lt!381328 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16280))))

(declare-fun b!844763 () Bool)

(assert (=> b!844763 (= e!471546 (and e!471543 mapRes!25361))))

(declare-fun condMapEmpty!25361 () Bool)

(declare-fun mapDefault!25361 () ValueCell!7481)

