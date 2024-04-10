; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41052 () Bool)

(assert start!41052)

(declare-fun b_free!10965 () Bool)

(declare-fun b_next!10965 () Bool)

(assert (=> start!41052 (= b_free!10965 (not b_next!10965))))

(declare-fun tp!38724 () Bool)

(declare-fun b_and!19137 () Bool)

(assert (=> start!41052 (= tp!38724 b_and!19137)))

(declare-fun b!457614 () Bool)

(declare-fun e!267254 () Bool)

(declare-fun e!267252 () Bool)

(declare-fun mapRes!20098 () Bool)

(assert (=> b!457614 (= e!267254 (and e!267252 mapRes!20098))))

(declare-fun condMapEmpty!20098 () Bool)

(declare-datatypes ((V!17509 0))(
  ( (V!17510 (val!6196 Int)) )
))
(declare-datatypes ((ValueCell!5808 0))(
  ( (ValueCellFull!5808 (v!8466 V!17509)) (EmptyCell!5808) )
))
(declare-datatypes ((array!28407 0))(
  ( (array!28408 (arr!13646 (Array (_ BitVec 32) ValueCell!5808)) (size!13998 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28407)

(declare-fun mapDefault!20098 () ValueCell!5808)

(assert (=> b!457614 (= condMapEmpty!20098 (= (arr!13646 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5808)) mapDefault!20098)))))

(declare-fun b!457616 () Bool)

(declare-fun res!273265 () Bool)

(declare-fun e!267257 () Bool)

(assert (=> b!457616 (=> (not res!273265) (not e!267257))))

(declare-datatypes ((array!28409 0))(
  ( (array!28410 (arr!13647 (Array (_ BitVec 32) (_ BitVec 64))) (size!13999 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28409)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28409 (_ BitVec 32)) Bool)

(assert (=> b!457616 (= res!273265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457617 () Bool)

(declare-fun res!273269 () Bool)

(declare-fun e!267258 () Bool)

(assert (=> b!457617 (=> (not res!273269) (not e!267258))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457617 (= res!273269 (bvsle from!863 i!563))))

(declare-fun b!457618 () Bool)

(declare-fun res!273271 () Bool)

(assert (=> b!457618 (=> (not res!273271) (not e!267257))))

(declare-datatypes ((List!8235 0))(
  ( (Nil!8232) (Cons!8231 (h!9087 (_ BitVec 64)) (t!14079 List!8235)) )
))
(declare-fun arrayNoDuplicates!0 (array!28409 (_ BitVec 32) List!8235) Bool)

(assert (=> b!457618 (= res!273271 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8232))))

(declare-fun b!457619 () Bool)

(declare-fun e!267253 () Bool)

(declare-fun tp_is_empty!12303 () Bool)

(assert (=> b!457619 (= e!267253 tp_is_empty!12303)))

(declare-fun b!457620 () Bool)

(declare-fun res!273267 () Bool)

(assert (=> b!457620 (=> (not res!273267) (not e!267257))))

(assert (=> b!457620 (= res!273267 (or (= (select (arr!13647 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13647 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457621 () Bool)

(declare-fun res!273272 () Bool)

(assert (=> b!457621 (=> (not res!273272) (not e!267257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457621 (= res!273272 (validMask!0 mask!1025))))

(declare-fun b!457622 () Bool)

(declare-fun res!273263 () Bool)

(assert (=> b!457622 (=> (not res!273263) (not e!267257))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457622 (= res!273263 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457623 () Bool)

(declare-fun res!273270 () Bool)

(assert (=> b!457623 (=> (not res!273270) (not e!267257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457623 (= res!273270 (validKeyInArray!0 k0!794))))

(declare-fun b!457624 () Bool)

(declare-fun e!267256 () Bool)

(assert (=> b!457624 (= e!267256 true)))

(declare-datatypes ((tuple2!8162 0))(
  ( (tuple2!8163 (_1!4092 (_ BitVec 64)) (_2!4092 V!17509)) )
))
(declare-datatypes ((List!8236 0))(
  ( (Nil!8233) (Cons!8232 (h!9088 tuple2!8162) (t!14080 List!8236)) )
))
(declare-datatypes ((ListLongMap!7075 0))(
  ( (ListLongMap!7076 (toList!3553 List!8236)) )
))
(declare-fun lt!206998 () ListLongMap!7075)

(declare-fun lt!206996 () ListLongMap!7075)

(declare-fun defaultEntry!557 () Int)

(declare-fun +!1589 (ListLongMap!7075 tuple2!8162) ListLongMap!7075)

(declare-fun get!6717 (ValueCell!5808 V!17509) V!17509)

(declare-fun dynLambda!879 (Int (_ BitVec 64)) V!17509)

(assert (=> b!457624 (= lt!206998 (+!1589 lt!206996 (tuple2!8163 (select (arr!13647 _keys!709) from!863) (get!6717 (select (arr!13646 _values!549) from!863) (dynLambda!879 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457625 () Bool)

(declare-fun res!273274 () Bool)

(assert (=> b!457625 (=> (not res!273274) (not e!267257))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!457625 (= res!273274 (and (= (size!13998 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13999 _keys!709) (size!13998 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457626 () Bool)

(declare-fun e!267251 () Bool)

(assert (=> b!457626 (= e!267251 (not e!267256))))

(declare-fun res!273264 () Bool)

(assert (=> b!457626 (=> res!273264 e!267256)))

(assert (=> b!457626 (= res!273264 (not (validKeyInArray!0 (select (arr!13647 _keys!709) from!863))))))

(declare-fun lt!207000 () ListLongMap!7075)

(assert (=> b!457626 (= lt!207000 lt!206996)))

(declare-fun lt!206997 () ListLongMap!7075)

(declare-fun v!412 () V!17509)

(assert (=> b!457626 (= lt!206996 (+!1589 lt!206997 (tuple2!8163 k0!794 v!412)))))

(declare-fun lt!206995 () array!28409)

(declare-fun minValue!515 () V!17509)

(declare-fun zeroValue!515 () V!17509)

(declare-fun lt!206999 () array!28407)

(declare-fun getCurrentListMapNoExtraKeys!1736 (array!28409 array!28407 (_ BitVec 32) (_ BitVec 32) V!17509 V!17509 (_ BitVec 32) Int) ListLongMap!7075)

(assert (=> b!457626 (= lt!207000 (getCurrentListMapNoExtraKeys!1736 lt!206995 lt!206999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457626 (= lt!206997 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13300 0))(
  ( (Unit!13301) )
))
(declare-fun lt!206993 () Unit!13300)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!749 (array!28409 array!28407 (_ BitVec 32) (_ BitVec 32) V!17509 V!17509 (_ BitVec 32) (_ BitVec 64) V!17509 (_ BitVec 32) Int) Unit!13300)

(assert (=> b!457626 (= lt!206993 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457615 () Bool)

(declare-fun res!273268 () Bool)

(assert (=> b!457615 (=> (not res!273268) (not e!267258))))

(assert (=> b!457615 (= res!273268 (arrayNoDuplicates!0 lt!206995 #b00000000000000000000000000000000 Nil!8232))))

(declare-fun res!273276 () Bool)

(assert (=> start!41052 (=> (not res!273276) (not e!267257))))

(assert (=> start!41052 (= res!273276 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13999 _keys!709))))))

(assert (=> start!41052 e!267257))

(assert (=> start!41052 tp_is_empty!12303))

(assert (=> start!41052 tp!38724))

(assert (=> start!41052 true))

(declare-fun array_inv!9882 (array!28407) Bool)

(assert (=> start!41052 (and (array_inv!9882 _values!549) e!267254)))

(declare-fun array_inv!9883 (array!28409) Bool)

(assert (=> start!41052 (array_inv!9883 _keys!709)))

(declare-fun b!457627 () Bool)

(assert (=> b!457627 (= e!267258 e!267251)))

(declare-fun res!273266 () Bool)

(assert (=> b!457627 (=> (not res!273266) (not e!267251))))

(assert (=> b!457627 (= res!273266 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457627 (= lt!206998 (getCurrentListMapNoExtraKeys!1736 lt!206995 lt!206999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457627 (= lt!206999 (array!28408 (store (arr!13646 _values!549) i!563 (ValueCellFull!5808 v!412)) (size!13998 _values!549)))))

(declare-fun lt!206994 () ListLongMap!7075)

(assert (=> b!457627 (= lt!206994 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457628 () Bool)

(declare-fun res!273275 () Bool)

(assert (=> b!457628 (=> (not res!273275) (not e!267257))))

(assert (=> b!457628 (= res!273275 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13999 _keys!709))))))

(declare-fun b!457629 () Bool)

(assert (=> b!457629 (= e!267252 tp_is_empty!12303)))

(declare-fun mapNonEmpty!20098 () Bool)

(declare-fun tp!38725 () Bool)

(assert (=> mapNonEmpty!20098 (= mapRes!20098 (and tp!38725 e!267253))))

(declare-fun mapValue!20098 () ValueCell!5808)

(declare-fun mapKey!20098 () (_ BitVec 32))

(declare-fun mapRest!20098 () (Array (_ BitVec 32) ValueCell!5808))

(assert (=> mapNonEmpty!20098 (= (arr!13646 _values!549) (store mapRest!20098 mapKey!20098 mapValue!20098))))

(declare-fun b!457630 () Bool)

(assert (=> b!457630 (= e!267257 e!267258)))

(declare-fun res!273273 () Bool)

(assert (=> b!457630 (=> (not res!273273) (not e!267258))))

(assert (=> b!457630 (= res!273273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206995 mask!1025))))

(assert (=> b!457630 (= lt!206995 (array!28410 (store (arr!13647 _keys!709) i!563 k0!794) (size!13999 _keys!709)))))

(declare-fun mapIsEmpty!20098 () Bool)

(assert (=> mapIsEmpty!20098 mapRes!20098))

(assert (= (and start!41052 res!273276) b!457621))

(assert (= (and b!457621 res!273272) b!457625))

(assert (= (and b!457625 res!273274) b!457616))

(assert (= (and b!457616 res!273265) b!457618))

(assert (= (and b!457618 res!273271) b!457628))

(assert (= (and b!457628 res!273275) b!457623))

(assert (= (and b!457623 res!273270) b!457620))

(assert (= (and b!457620 res!273267) b!457622))

(assert (= (and b!457622 res!273263) b!457630))

(assert (= (and b!457630 res!273273) b!457615))

(assert (= (and b!457615 res!273268) b!457617))

(assert (= (and b!457617 res!273269) b!457627))

(assert (= (and b!457627 res!273266) b!457626))

(assert (= (and b!457626 (not res!273264)) b!457624))

(assert (= (and b!457614 condMapEmpty!20098) mapIsEmpty!20098))

(assert (= (and b!457614 (not condMapEmpty!20098)) mapNonEmpty!20098))

(get-info :version)

(assert (= (and mapNonEmpty!20098 ((_ is ValueCellFull!5808) mapValue!20098)) b!457619))

(assert (= (and b!457614 ((_ is ValueCellFull!5808) mapDefault!20098)) b!457629))

(assert (= start!41052 b!457614))

(declare-fun b_lambda!9731 () Bool)

(assert (=> (not b_lambda!9731) (not b!457624)))

(declare-fun t!14078 () Bool)

(declare-fun tb!3801 () Bool)

(assert (=> (and start!41052 (= defaultEntry!557 defaultEntry!557) t!14078) tb!3801))

(declare-fun result!7143 () Bool)

(assert (=> tb!3801 (= result!7143 tp_is_empty!12303)))

(assert (=> b!457624 t!14078))

(declare-fun b_and!19139 () Bool)

(assert (= b_and!19137 (and (=> t!14078 result!7143) b_and!19139)))

(declare-fun m!440961 () Bool)

(assert (=> b!457621 m!440961))

(declare-fun m!440963 () Bool)

(assert (=> b!457630 m!440963))

(declare-fun m!440965 () Bool)

(assert (=> b!457630 m!440965))

(declare-fun m!440967 () Bool)

(assert (=> start!41052 m!440967))

(declare-fun m!440969 () Bool)

(assert (=> start!41052 m!440969))

(declare-fun m!440971 () Bool)

(assert (=> b!457626 m!440971))

(declare-fun m!440973 () Bool)

(assert (=> b!457626 m!440973))

(assert (=> b!457626 m!440971))

(declare-fun m!440975 () Bool)

(assert (=> b!457626 m!440975))

(declare-fun m!440977 () Bool)

(assert (=> b!457626 m!440977))

(declare-fun m!440979 () Bool)

(assert (=> b!457626 m!440979))

(declare-fun m!440981 () Bool)

(assert (=> b!457626 m!440981))

(declare-fun m!440983 () Bool)

(assert (=> b!457616 m!440983))

(declare-fun m!440985 () Bool)

(assert (=> mapNonEmpty!20098 m!440985))

(assert (=> b!457624 m!440971))

(declare-fun m!440987 () Bool)

(assert (=> b!457624 m!440987))

(declare-fun m!440989 () Bool)

(assert (=> b!457624 m!440989))

(declare-fun m!440991 () Bool)

(assert (=> b!457624 m!440991))

(assert (=> b!457624 m!440989))

(assert (=> b!457624 m!440987))

(declare-fun m!440993 () Bool)

(assert (=> b!457624 m!440993))

(declare-fun m!440995 () Bool)

(assert (=> b!457618 m!440995))

(declare-fun m!440997 () Bool)

(assert (=> b!457620 m!440997))

(declare-fun m!440999 () Bool)

(assert (=> b!457627 m!440999))

(declare-fun m!441001 () Bool)

(assert (=> b!457627 m!441001))

(declare-fun m!441003 () Bool)

(assert (=> b!457627 m!441003))

(declare-fun m!441005 () Bool)

(assert (=> b!457615 m!441005))

(declare-fun m!441007 () Bool)

(assert (=> b!457623 m!441007))

(declare-fun m!441009 () Bool)

(assert (=> b!457622 m!441009))

(check-sat (not b_lambda!9731) b_and!19139 (not b!457615) tp_is_empty!12303 (not b!457616) (not b!457622) (not start!41052) (not b!457621) (not b!457618) (not b!457624) (not mapNonEmpty!20098) (not b!457626) (not b!457623) (not b_next!10965) (not b!457627) (not b!457630))
(check-sat b_and!19139 (not b_next!10965))
