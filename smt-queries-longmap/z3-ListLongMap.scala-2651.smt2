; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39710 () Bool)

(assert start!39710)

(declare-fun b_free!9991 () Bool)

(declare-fun b_next!9991 () Bool)

(assert (=> start!39710 (= b_free!9991 (not b_next!9991))))

(declare-fun tp!35501 () Bool)

(declare-fun b_and!17621 () Bool)

(assert (=> start!39710 (= tp!35501 b_and!17621)))

(declare-fun b!426930 () Bool)

(declare-fun e!253160 () Bool)

(declare-fun tp_is_empty!11143 () Bool)

(assert (=> b!426930 (= e!253160 tp_is_empty!11143)))

(declare-fun b!426931 () Bool)

(declare-fun res!250399 () Bool)

(declare-fun e!253165 () Bool)

(assert (=> b!426931 (=> (not res!250399) (not e!253165))))

(declare-datatypes ((array!26115 0))(
  ( (array!26116 (arr!12507 (Array (_ BitVec 32) (_ BitVec 64))) (size!12860 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26115)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426931 (= res!250399 (or (= (select (arr!12507 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12507 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426932 () Bool)

(declare-fun e!253163 () Bool)

(declare-fun e!253162 () Bool)

(assert (=> b!426932 (= e!253163 (not e!253162))))

(declare-fun res!250389 () Bool)

(assert (=> b!426932 (=> res!250389 e!253162)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426932 (= res!250389 (not (validKeyInArray!0 (select (arr!12507 _keys!709) from!863))))))

(declare-datatypes ((V!15963 0))(
  ( (V!15964 (val!5616 Int)) )
))
(declare-fun minValue!515 () V!15963)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5228 0))(
  ( (ValueCellFull!5228 (v!7857 V!15963)) (EmptyCell!5228) )
))
(declare-datatypes ((array!26117 0))(
  ( (array!26118 (arr!12508 (Array (_ BitVec 32) ValueCell!5228)) (size!12861 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26117)

(declare-fun zeroValue!515 () V!15963)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!194968 () array!26117)

(declare-fun lt!194966 () array!26115)

(declare-fun v!412 () V!15963)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7380 0))(
  ( (tuple2!7381 (_1!3701 (_ BitVec 64)) (_2!3701 V!15963)) )
))
(declare-datatypes ((List!7383 0))(
  ( (Nil!7380) (Cons!7379 (h!8235 tuple2!7380) (t!12818 List!7383)) )
))
(declare-datatypes ((ListLongMap!6283 0))(
  ( (ListLongMap!6284 (toList!3157 List!7383)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1365 (array!26115 array!26117 (_ BitVec 32) (_ BitVec 32) V!15963 V!15963 (_ BitVec 32) Int) ListLongMap!6283)

(declare-fun +!1336 (ListLongMap!6283 tuple2!7380) ListLongMap!6283)

(assert (=> b!426932 (= (getCurrentListMapNoExtraKeys!1365 lt!194966 lt!194968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1336 (getCurrentListMapNoExtraKeys!1365 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7381 k0!794 v!412)))))

(declare-datatypes ((Unit!12518 0))(
  ( (Unit!12519) )
))
(declare-fun lt!194967 () Unit!12518)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 (array!26115 array!26117 (_ BitVec 32) (_ BitVec 32) V!15963 V!15963 (_ BitVec 32) (_ BitVec 64) V!15963 (_ BitVec 32) Int) Unit!12518)

(assert (=> b!426932 (= lt!194967 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426933 () Bool)

(declare-fun res!250396 () Bool)

(declare-fun e!253161 () Bool)

(assert (=> b!426933 (=> (not res!250396) (not e!253161))))

(declare-datatypes ((List!7384 0))(
  ( (Nil!7381) (Cons!7380 (h!8236 (_ BitVec 64)) (t!12819 List!7384)) )
))
(declare-fun arrayNoDuplicates!0 (array!26115 (_ BitVec 32) List!7384) Bool)

(assert (=> b!426933 (= res!250396 (arrayNoDuplicates!0 lt!194966 #b00000000000000000000000000000000 Nil!7381))))

(declare-fun b!426934 () Bool)

(declare-fun res!250398 () Bool)

(assert (=> b!426934 (=> (not res!250398) (not e!253165))))

(assert (=> b!426934 (= res!250398 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12860 _keys!709))))))

(declare-fun b!426935 () Bool)

(declare-fun res!250401 () Bool)

(assert (=> b!426935 (=> (not res!250401) (not e!253165))))

(assert (=> b!426935 (= res!250401 (and (= (size!12861 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12860 _keys!709) (size!12861 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426936 () Bool)

(declare-fun e!253167 () Bool)

(declare-fun mapRes!18336 () Bool)

(assert (=> b!426936 (= e!253167 (and e!253160 mapRes!18336))))

(declare-fun condMapEmpty!18336 () Bool)

(declare-fun mapDefault!18336 () ValueCell!5228)

(assert (=> b!426936 (= condMapEmpty!18336 (= (arr!12508 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5228)) mapDefault!18336)))))

(declare-fun b!426937 () Bool)

(declare-fun res!250393 () Bool)

(assert (=> b!426937 (=> (not res!250393) (not e!253161))))

(assert (=> b!426937 (= res!250393 (bvsle from!863 i!563))))

(declare-fun b!426938 () Bool)

(assert (=> b!426938 (= e!253161 e!253163)))

(declare-fun res!250397 () Bool)

(assert (=> b!426938 (=> (not res!250397) (not e!253163))))

(assert (=> b!426938 (= res!250397 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194965 () ListLongMap!6283)

(assert (=> b!426938 (= lt!194965 (getCurrentListMapNoExtraKeys!1365 lt!194966 lt!194968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426938 (= lt!194968 (array!26118 (store (arr!12508 _values!549) i!563 (ValueCellFull!5228 v!412)) (size!12861 _values!549)))))

(declare-fun lt!194969 () ListLongMap!6283)

(assert (=> b!426938 (= lt!194969 (getCurrentListMapNoExtraKeys!1365 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426939 () Bool)

(declare-fun res!250391 () Bool)

(assert (=> b!426939 (=> (not res!250391) (not e!253165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426939 (= res!250391 (validMask!0 mask!1025))))

(declare-fun b!426940 () Bool)

(declare-fun e!253164 () Bool)

(assert (=> b!426940 (= e!253164 tp_is_empty!11143)))

(declare-fun res!250394 () Bool)

(assert (=> start!39710 (=> (not res!250394) (not e!253165))))

(assert (=> start!39710 (= res!250394 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12860 _keys!709))))))

(assert (=> start!39710 e!253165))

(assert (=> start!39710 tp_is_empty!11143))

(assert (=> start!39710 tp!35501))

(assert (=> start!39710 true))

(declare-fun array_inv!9144 (array!26117) Bool)

(assert (=> start!39710 (and (array_inv!9144 _values!549) e!253167)))

(declare-fun array_inv!9145 (array!26115) Bool)

(assert (=> start!39710 (array_inv!9145 _keys!709)))

(declare-fun b!426941 () Bool)

(declare-fun res!250392 () Bool)

(assert (=> b!426941 (=> (not res!250392) (not e!253165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26115 (_ BitVec 32)) Bool)

(assert (=> b!426941 (= res!250392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18336 () Bool)

(declare-fun tp!35502 () Bool)

(assert (=> mapNonEmpty!18336 (= mapRes!18336 (and tp!35502 e!253164))))

(declare-fun mapValue!18336 () ValueCell!5228)

(declare-fun mapKey!18336 () (_ BitVec 32))

(declare-fun mapRest!18336 () (Array (_ BitVec 32) ValueCell!5228))

(assert (=> mapNonEmpty!18336 (= (arr!12508 _values!549) (store mapRest!18336 mapKey!18336 mapValue!18336))))

(declare-fun b!426942 () Bool)

(assert (=> b!426942 (= e!253162 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12860 _keys!709))))))

(declare-fun b!426943 () Bool)

(assert (=> b!426943 (= e!253165 e!253161)))

(declare-fun res!250400 () Bool)

(assert (=> b!426943 (=> (not res!250400) (not e!253161))))

(assert (=> b!426943 (= res!250400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194966 mask!1025))))

(assert (=> b!426943 (= lt!194966 (array!26116 (store (arr!12507 _keys!709) i!563 k0!794) (size!12860 _keys!709)))))

(declare-fun b!426944 () Bool)

(declare-fun res!250388 () Bool)

(assert (=> b!426944 (=> (not res!250388) (not e!253165))))

(declare-fun arrayContainsKey!0 (array!26115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426944 (= res!250388 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426945 () Bool)

(declare-fun res!250390 () Bool)

(assert (=> b!426945 (=> (not res!250390) (not e!253165))))

(assert (=> b!426945 (= res!250390 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7381))))

(declare-fun b!426946 () Bool)

(declare-fun res!250395 () Bool)

(assert (=> b!426946 (=> (not res!250395) (not e!253165))))

(assert (=> b!426946 (= res!250395 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18336 () Bool)

(assert (=> mapIsEmpty!18336 mapRes!18336))

(assert (= (and start!39710 res!250394) b!426939))

(assert (= (and b!426939 res!250391) b!426935))

(assert (= (and b!426935 res!250401) b!426941))

(assert (= (and b!426941 res!250392) b!426945))

(assert (= (and b!426945 res!250390) b!426934))

(assert (= (and b!426934 res!250398) b!426946))

(assert (= (and b!426946 res!250395) b!426931))

(assert (= (and b!426931 res!250399) b!426944))

(assert (= (and b!426944 res!250388) b!426943))

(assert (= (and b!426943 res!250400) b!426933))

(assert (= (and b!426933 res!250396) b!426937))

(assert (= (and b!426937 res!250393) b!426938))

(assert (= (and b!426938 res!250397) b!426932))

(assert (= (and b!426932 (not res!250389)) b!426942))

(assert (= (and b!426936 condMapEmpty!18336) mapIsEmpty!18336))

(assert (= (and b!426936 (not condMapEmpty!18336)) mapNonEmpty!18336))

(get-info :version)

(assert (= (and mapNonEmpty!18336 ((_ is ValueCellFull!5228) mapValue!18336)) b!426940))

(assert (= (and b!426936 ((_ is ValueCellFull!5228) mapDefault!18336)) b!426930))

(assert (= start!39710 b!426936))

(declare-fun m!414999 () Bool)

(assert (=> start!39710 m!414999))

(declare-fun m!415001 () Bool)

(assert (=> start!39710 m!415001))

(declare-fun m!415003 () Bool)

(assert (=> mapNonEmpty!18336 m!415003))

(declare-fun m!415005 () Bool)

(assert (=> b!426933 m!415005))

(declare-fun m!415007 () Bool)

(assert (=> b!426939 m!415007))

(declare-fun m!415009 () Bool)

(assert (=> b!426932 m!415009))

(declare-fun m!415011 () Bool)

(assert (=> b!426932 m!415011))

(assert (=> b!426932 m!415011))

(declare-fun m!415013 () Bool)

(assert (=> b!426932 m!415013))

(declare-fun m!415015 () Bool)

(assert (=> b!426932 m!415015))

(declare-fun m!415017 () Bool)

(assert (=> b!426932 m!415017))

(assert (=> b!426932 m!415009))

(declare-fun m!415019 () Bool)

(assert (=> b!426932 m!415019))

(declare-fun m!415021 () Bool)

(assert (=> b!426931 m!415021))

(declare-fun m!415023 () Bool)

(assert (=> b!426945 m!415023))

(declare-fun m!415025 () Bool)

(assert (=> b!426941 m!415025))

(declare-fun m!415027 () Bool)

(assert (=> b!426943 m!415027))

(declare-fun m!415029 () Bool)

(assert (=> b!426943 m!415029))

(declare-fun m!415031 () Bool)

(assert (=> b!426946 m!415031))

(declare-fun m!415033 () Bool)

(assert (=> b!426938 m!415033))

(declare-fun m!415035 () Bool)

(assert (=> b!426938 m!415035))

(declare-fun m!415037 () Bool)

(assert (=> b!426938 m!415037))

(declare-fun m!415039 () Bool)

(assert (=> b!426944 m!415039))

(check-sat (not b!426945) (not b!426944) (not b!426938) (not b!426941) (not b!426946) (not b!426939) (not mapNonEmpty!18336) (not b_next!9991) (not b!426932) tp_is_empty!11143 (not b!426943) b_and!17621 (not b!426933) (not start!39710))
(check-sat b_and!17621 (not b_next!9991))
