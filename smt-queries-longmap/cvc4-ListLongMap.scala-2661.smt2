; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39788 () Bool)

(assert start!39788)

(declare-fun b_free!10055 () Bool)

(declare-fun b_next!10055 () Bool)

(assert (=> start!39788 (= b_free!10055 (not b_next!10055))))

(declare-fun tp!35694 () Bool)

(declare-fun b_and!17769 () Bool)

(assert (=> start!39788 (= tp!35694 b_and!17769)))

(declare-fun b!428961 () Bool)

(declare-fun res!251866 () Bool)

(declare-fun e!254138 () Bool)

(assert (=> b!428961 (=> (not res!251866) (not e!254138))))

(declare-datatypes ((array!26251 0))(
  ( (array!26252 (arr!12575 (Array (_ BitVec 32) (_ BitVec 64))) (size!12927 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26251)

(declare-datatypes ((List!7452 0))(
  ( (Nil!7449) (Cons!7448 (h!8304 (_ BitVec 64)) (t!12956 List!7452)) )
))
(declare-fun arrayNoDuplicates!0 (array!26251 (_ BitVec 32) List!7452) Bool)

(assert (=> b!428961 (= res!251866 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7449))))

(declare-fun b!428963 () Bool)

(declare-fun res!251865 () Bool)

(assert (=> b!428963 (=> (not res!251865) (not e!254138))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428963 (= res!251865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12927 _keys!709))))))

(declare-fun b!428964 () Bool)

(declare-fun e!254145 () Bool)

(declare-fun tp_is_empty!11207 () Bool)

(assert (=> b!428964 (= e!254145 tp_is_empty!11207)))

(declare-fun b!428965 () Bool)

(declare-datatypes ((Unit!12602 0))(
  ( (Unit!12603) )
))
(declare-fun e!254144 () Unit!12602)

(declare-fun Unit!12604 () Unit!12602)

(assert (=> b!428965 (= e!254144 Unit!12604)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!196025 () Unit!12602)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12602)

(assert (=> b!428965 (= lt!196025 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428965 false))

(declare-fun b!428966 () Bool)

(declare-fun e!254140 () Bool)

(assert (=> b!428966 (= e!254140 true)))

(assert (=> b!428966 (not (= (select (arr!12575 _keys!709) from!863) k!794))))

(declare-fun lt!196017 () Unit!12602)

(assert (=> b!428966 (= lt!196017 e!254144)))

(declare-fun c!55418 () Bool)

(assert (=> b!428966 (= c!55418 (= (select (arr!12575 _keys!709) from!863) k!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16047 0))(
  ( (V!16048 (val!5648 Int)) )
))
(declare-datatypes ((tuple2!7438 0))(
  ( (tuple2!7439 (_1!3730 (_ BitVec 64)) (_2!3730 V!16047)) )
))
(declare-datatypes ((List!7453 0))(
  ( (Nil!7450) (Cons!7449 (h!8305 tuple2!7438) (t!12957 List!7453)) )
))
(declare-datatypes ((ListLongMap!6351 0))(
  ( (ListLongMap!6352 (toList!3191 List!7453)) )
))
(declare-fun lt!196021 () ListLongMap!6351)

(declare-datatypes ((ValueCell!5260 0))(
  ( (ValueCellFull!5260 (v!7895 V!16047)) (EmptyCell!5260) )
))
(declare-datatypes ((array!26253 0))(
  ( (array!26254 (arr!12576 (Array (_ BitVec 32) ValueCell!5260)) (size!12928 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26253)

(declare-fun lt!196019 () ListLongMap!6351)

(declare-fun +!1342 (ListLongMap!6351 tuple2!7438) ListLongMap!6351)

(declare-fun get!6234 (ValueCell!5260 V!16047) V!16047)

(declare-fun dynLambda!769 (Int (_ BitVec 64)) V!16047)

(assert (=> b!428966 (= lt!196021 (+!1342 lt!196019 (tuple2!7439 (select (arr!12575 _keys!709) from!863) (get!6234 (select (arr!12576 _values!549) from!863) (dynLambda!769 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!18432 () Bool)

(declare-fun mapRes!18432 () Bool)

(declare-fun tp!35693 () Bool)

(assert (=> mapNonEmpty!18432 (= mapRes!18432 (and tp!35693 e!254145))))

(declare-fun mapRest!18432 () (Array (_ BitVec 32) ValueCell!5260))

(declare-fun mapKey!18432 () (_ BitVec 32))

(declare-fun mapValue!18432 () ValueCell!5260)

(assert (=> mapNonEmpty!18432 (= (arr!12576 _values!549) (store mapRest!18432 mapKey!18432 mapValue!18432))))

(declare-fun b!428967 () Bool)

(declare-fun res!251871 () Bool)

(declare-fun e!254137 () Bool)

(assert (=> b!428967 (=> (not res!251871) (not e!254137))))

(declare-fun lt!196020 () array!26251)

(assert (=> b!428967 (= res!251871 (arrayNoDuplicates!0 lt!196020 #b00000000000000000000000000000000 Nil!7449))))

(declare-fun b!428968 () Bool)

(declare-fun res!251869 () Bool)

(assert (=> b!428968 (=> (not res!251869) (not e!254138))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26251 (_ BitVec 32)) Bool)

(assert (=> b!428968 (= res!251869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!251867 () Bool)

(assert (=> start!39788 (=> (not res!251867) (not e!254138))))

(assert (=> start!39788 (= res!251867 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12927 _keys!709))))))

(assert (=> start!39788 e!254138))

(assert (=> start!39788 tp_is_empty!11207))

(assert (=> start!39788 tp!35694))

(assert (=> start!39788 true))

(declare-fun e!254141 () Bool)

(declare-fun array_inv!9166 (array!26253) Bool)

(assert (=> start!39788 (and (array_inv!9166 _values!549) e!254141)))

(declare-fun array_inv!9167 (array!26251) Bool)

(assert (=> start!39788 (array_inv!9167 _keys!709)))

(declare-fun b!428962 () Bool)

(declare-fun e!254142 () Bool)

(assert (=> b!428962 (= e!254137 e!254142)))

(declare-fun res!251872 () Bool)

(assert (=> b!428962 (=> (not res!251872) (not e!254142))))

(assert (=> b!428962 (= res!251872 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16047)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16047)

(declare-fun lt!196024 () array!26253)

(declare-fun getCurrentListMapNoExtraKeys!1393 (array!26251 array!26253 (_ BitVec 32) (_ BitVec 32) V!16047 V!16047 (_ BitVec 32) Int) ListLongMap!6351)

(assert (=> b!428962 (= lt!196021 (getCurrentListMapNoExtraKeys!1393 lt!196020 lt!196024 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16047)

(assert (=> b!428962 (= lt!196024 (array!26254 (store (arr!12576 _values!549) i!563 (ValueCellFull!5260 v!412)) (size!12928 _values!549)))))

(declare-fun lt!196022 () ListLongMap!6351)

(assert (=> b!428962 (= lt!196022 (getCurrentListMapNoExtraKeys!1393 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428969 () Bool)

(declare-fun res!251868 () Bool)

(assert (=> b!428969 (=> (not res!251868) (not e!254137))))

(assert (=> b!428969 (= res!251868 (bvsle from!863 i!563))))

(declare-fun b!428970 () Bool)

(declare-fun e!254143 () Bool)

(assert (=> b!428970 (= e!254141 (and e!254143 mapRes!18432))))

(declare-fun condMapEmpty!18432 () Bool)

(declare-fun mapDefault!18432 () ValueCell!5260)

