; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39244 () Bool)

(assert start!39244)

(declare-fun b_free!9511 () Bool)

(declare-fun b_next!9511 () Bool)

(assert (=> start!39244 (= b_free!9511 (not b_next!9511))))

(declare-fun tp!34062 () Bool)

(declare-fun b_and!16897 () Bool)

(assert (=> start!39244 (= tp!34062 b_and!16897)))

(declare-fun b!414362 () Bool)

(declare-fun res!240915 () Bool)

(declare-fun e!247654 () Bool)

(assert (=> b!414362 (=> (not res!240915) (not e!247654))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414362 (= res!240915 (validMask!0 mask!1025))))

(declare-fun b!414363 () Bool)

(declare-fun res!240921 () Bool)

(assert (=> b!414363 (=> (not res!240921) (not e!247654))))

(declare-datatypes ((array!25183 0))(
  ( (array!25184 (arr!12041 (Array (_ BitVec 32) (_ BitVec 64))) (size!12393 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25183)

(declare-datatypes ((List!7014 0))(
  ( (Nil!7011) (Cons!7010 (h!7866 (_ BitVec 64)) (t!12190 List!7014)) )
))
(declare-fun arrayNoDuplicates!0 (array!25183 (_ BitVec 32) List!7014) Bool)

(assert (=> b!414363 (= res!240921 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7011))))

(declare-fun b!414364 () Bool)

(declare-fun res!240918 () Bool)

(assert (=> b!414364 (=> (not res!240918) (not e!247654))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414364 (= res!240918 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!414365 () Bool)

(declare-fun res!240923 () Bool)

(assert (=> b!414365 (=> (not res!240923) (not e!247654))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414365 (= res!240923 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12393 _keys!709))))))

(declare-fun mapNonEmpty!17616 () Bool)

(declare-fun mapRes!17616 () Bool)

(declare-fun tp!34061 () Bool)

(declare-fun e!247656 () Bool)

(assert (=> mapNonEmpty!17616 (= mapRes!17616 (and tp!34061 e!247656))))

(declare-datatypes ((V!15323 0))(
  ( (V!15324 (val!5376 Int)) )
))
(declare-datatypes ((ValueCell!4988 0))(
  ( (ValueCellFull!4988 (v!7623 V!15323)) (EmptyCell!4988) )
))
(declare-fun mapRest!17616 () (Array (_ BitVec 32) ValueCell!4988))

(declare-fun mapValue!17616 () ValueCell!4988)

(declare-datatypes ((array!25185 0))(
  ( (array!25186 (arr!12042 (Array (_ BitVec 32) ValueCell!4988)) (size!12394 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25185)

(declare-fun mapKey!17616 () (_ BitVec 32))

(assert (=> mapNonEmpty!17616 (= (arr!12042 _values!549) (store mapRest!17616 mapKey!17616 mapValue!17616))))

(declare-fun b!414366 () Bool)

(declare-fun e!247653 () Bool)

(declare-fun tp_is_empty!10663 () Bool)

(assert (=> b!414366 (= e!247653 tp_is_empty!10663)))

(declare-fun res!240916 () Bool)

(assert (=> start!39244 (=> (not res!240916) (not e!247654))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39244 (= res!240916 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12393 _keys!709))))))

(assert (=> start!39244 e!247654))

(assert (=> start!39244 tp_is_empty!10663))

(assert (=> start!39244 tp!34062))

(assert (=> start!39244 true))

(declare-fun e!247650 () Bool)

(declare-fun array_inv!8780 (array!25185) Bool)

(assert (=> start!39244 (and (array_inv!8780 _values!549) e!247650)))

(declare-fun array_inv!8781 (array!25183) Bool)

(assert (=> start!39244 (array_inv!8781 _keys!709)))

(declare-fun b!414367 () Bool)

(declare-fun e!247655 () Bool)

(assert (=> b!414367 (= e!247654 e!247655)))

(declare-fun res!240914 () Bool)

(assert (=> b!414367 (=> (not res!240914) (not e!247655))))

(declare-fun lt!189981 () array!25183)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25183 (_ BitVec 32)) Bool)

(assert (=> b!414367 (= res!240914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189981 mask!1025))))

(assert (=> b!414367 (= lt!189981 (array!25184 (store (arr!12041 _keys!709) i!563 k!794) (size!12393 _keys!709)))))

(declare-fun mapIsEmpty!17616 () Bool)

(assert (=> mapIsEmpty!17616 mapRes!17616))

(declare-fun b!414368 () Bool)

(declare-fun res!240920 () Bool)

(assert (=> b!414368 (=> (not res!240920) (not e!247655))))

(assert (=> b!414368 (= res!240920 (arrayNoDuplicates!0 lt!189981 #b00000000000000000000000000000000 Nil!7011))))

(declare-datatypes ((tuple2!6992 0))(
  ( (tuple2!6993 (_1!3507 (_ BitVec 64)) (_2!3507 V!15323)) )
))
(declare-datatypes ((List!7015 0))(
  ( (Nil!7012) (Cons!7011 (h!7867 tuple2!6992) (t!12191 List!7015)) )
))
(declare-datatypes ((ListLongMap!5905 0))(
  ( (ListLongMap!5906 (toList!2968 List!7015)) )
))
(declare-fun call!28712 () ListLongMap!5905)

(declare-fun e!247652 () Bool)

(declare-fun b!414369 () Bool)

(declare-fun call!28711 () ListLongMap!5905)

(declare-fun v!412 () V!15323)

(declare-fun +!1174 (ListLongMap!5905 tuple2!6992) ListLongMap!5905)

(assert (=> b!414369 (= e!247652 (= call!28712 (+!1174 call!28711 (tuple2!6993 k!794 v!412))))))

(declare-fun b!414370 () Bool)

(declare-fun res!240925 () Bool)

(assert (=> b!414370 (=> (not res!240925) (not e!247654))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!414370 (= res!240925 (and (= (size!12394 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12393 _keys!709) (size!12394 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414371 () Bool)

(declare-fun e!247651 () Bool)

(assert (=> b!414371 (= e!247655 e!247651)))

(declare-fun res!240917 () Bool)

(assert (=> b!414371 (=> (not res!240917) (not e!247651))))

(assert (=> b!414371 (= res!240917 (= from!863 i!563))))

(declare-fun minValue!515 () V!15323)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15323)

(declare-fun lt!189982 () array!25185)

(declare-fun lt!189980 () ListLongMap!5905)

(declare-fun getCurrentListMapNoExtraKeys!1174 (array!25183 array!25185 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) Int) ListLongMap!5905)

(assert (=> b!414371 (= lt!189980 (getCurrentListMapNoExtraKeys!1174 lt!189981 lt!189982 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414371 (= lt!189982 (array!25186 (store (arr!12042 _values!549) i!563 (ValueCellFull!4988 v!412)) (size!12394 _values!549)))))

(declare-fun lt!189983 () ListLongMap!5905)

(assert (=> b!414371 (= lt!189983 (getCurrentListMapNoExtraKeys!1174 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414372 () Bool)

(assert (=> b!414372 (= e!247656 tp_is_empty!10663)))

(declare-fun bm!28708 () Bool)

(declare-fun c!54980 () Bool)

(assert (=> bm!28708 (= call!28711 (getCurrentListMapNoExtraKeys!1174 (ite c!54980 _keys!709 lt!189981) (ite c!54980 _values!549 lt!189982) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414373 () Bool)

(declare-fun res!240924 () Bool)

(assert (=> b!414373 (=> (not res!240924) (not e!247654))))

(assert (=> b!414373 (= res!240924 (or (= (select (arr!12041 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12041 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414374 () Bool)

(declare-fun res!240922 () Bool)

(assert (=> b!414374 (=> (not res!240922) (not e!247654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414374 (= res!240922 (validKeyInArray!0 k!794))))

(declare-fun b!414375 () Bool)

(declare-fun e!247649 () Bool)

(assert (=> b!414375 (= e!247649 true)))

(declare-fun get!5937 (ValueCell!4988 V!15323) V!15323)

(declare-fun dynLambda!652 (Int (_ BitVec 64)) V!15323)

(assert (=> b!414375 (= lt!189980 (+!1174 (getCurrentListMapNoExtraKeys!1174 lt!189981 lt!189982 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6993 (select (arr!12041 lt!189981) from!863) (get!5937 (select (arr!12042 lt!189982) from!863) (dynLambda!652 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414376 () Bool)

(declare-fun res!240919 () Bool)

(assert (=> b!414376 (=> (not res!240919) (not e!247654))))

(assert (=> b!414376 (= res!240919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414377 () Bool)

(declare-fun res!240927 () Bool)

(assert (=> b!414377 (=> (not res!240927) (not e!247655))))

(assert (=> b!414377 (= res!240927 (bvsle from!863 i!563))))

(declare-fun bm!28709 () Bool)

(assert (=> bm!28709 (= call!28712 (getCurrentListMapNoExtraKeys!1174 (ite c!54980 lt!189981 _keys!709) (ite c!54980 lt!189982 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414378 () Bool)

(assert (=> b!414378 (= e!247652 (= call!28711 call!28712))))

(declare-fun b!414379 () Bool)

(assert (=> b!414379 (= e!247651 (not e!247649))))

(declare-fun res!240926 () Bool)

(assert (=> b!414379 (=> res!240926 e!247649)))

(assert (=> b!414379 (= res!240926 (validKeyInArray!0 (select (arr!12041 _keys!709) from!863)))))

(assert (=> b!414379 e!247652))

(assert (=> b!414379 (= c!54980 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12254 0))(
  ( (Unit!12255) )
))
(declare-fun lt!189979 () Unit!12254)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!385 (array!25183 array!25185 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) (_ BitVec 64) V!15323 (_ BitVec 32) Int) Unit!12254)

(assert (=> b!414379 (= lt!189979 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!385 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414380 () Bool)

(assert (=> b!414380 (= e!247650 (and e!247653 mapRes!17616))))

(declare-fun condMapEmpty!17616 () Bool)

(declare-fun mapDefault!17616 () ValueCell!4988)

