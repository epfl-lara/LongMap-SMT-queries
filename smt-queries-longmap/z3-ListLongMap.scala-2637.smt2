; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39642 () Bool)

(assert start!39642)

(declare-fun b_free!9909 () Bool)

(declare-fun b_next!9909 () Bool)

(assert (=> start!39642 (= b_free!9909 (not b_next!9909))))

(declare-fun tp!35255 () Bool)

(declare-fun b_and!17565 () Bool)

(assert (=> start!39642 (= tp!35255 b_and!17565)))

(declare-fun b!425231 () Bool)

(declare-fun res!248928 () Bool)

(declare-fun e!252474 () Bool)

(assert (=> b!425231 (=> (not res!248928) (not e!252474))))

(declare-datatypes ((array!25961 0))(
  ( (array!25962 (arr!12430 (Array (_ BitVec 32) (_ BitVec 64))) (size!12782 (_ BitVec 32))) )
))
(declare-fun lt!194588 () array!25961)

(declare-datatypes ((List!7332 0))(
  ( (Nil!7329) (Cons!7328 (h!8184 (_ BitVec 64)) (t!12776 List!7332)) )
))
(declare-fun arrayNoDuplicates!0 (array!25961 (_ BitVec 32) List!7332) Bool)

(assert (=> b!425231 (= res!248928 (arrayNoDuplicates!0 lt!194588 #b00000000000000000000000000000000 Nil!7329))))

(declare-fun b!425232 () Bool)

(declare-fun res!248920 () Bool)

(declare-fun e!252471 () Bool)

(assert (=> b!425232 (=> (not res!248920) (not e!252471))))

(declare-fun _keys!709 () array!25961)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25961 (_ BitVec 32)) Bool)

(assert (=> b!425232 (= res!248920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425233 () Bool)

(declare-fun res!248924 () Bool)

(assert (=> b!425233 (=> (not res!248924) (not e!252471))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425233 (= res!248924 (or (= (select (arr!12430 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12430 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18213 () Bool)

(declare-fun mapRes!18213 () Bool)

(assert (=> mapIsEmpty!18213 mapRes!18213))

(declare-fun b!425234 () Bool)

(declare-fun e!252477 () Bool)

(assert (=> b!425234 (= e!252474 e!252477)))

(declare-fun res!248917 () Bool)

(assert (=> b!425234 (=> (not res!248917) (not e!252477))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425234 (= res!248917 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15853 0))(
  ( (V!15854 (val!5575 Int)) )
))
(declare-fun minValue!515 () V!15853)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15853)

(declare-datatypes ((ValueCell!5187 0))(
  ( (ValueCellFull!5187 (v!7822 V!15853)) (EmptyCell!5187) )
))
(declare-datatypes ((array!25963 0))(
  ( (array!25964 (arr!12431 (Array (_ BitVec 32) ValueCell!5187)) (size!12783 (_ BitVec 32))) )
))
(declare-fun lt!194585 () array!25963)

(declare-datatypes ((tuple2!7320 0))(
  ( (tuple2!7321 (_1!3671 (_ BitVec 64)) (_2!3671 V!15853)) )
))
(declare-datatypes ((List!7333 0))(
  ( (Nil!7330) (Cons!7329 (h!8185 tuple2!7320) (t!12777 List!7333)) )
))
(declare-datatypes ((ListLongMap!6233 0))(
  ( (ListLongMap!6234 (toList!3132 List!7333)) )
))
(declare-fun lt!194584 () ListLongMap!6233)

(declare-fun getCurrentListMapNoExtraKeys!1336 (array!25961 array!25963 (_ BitVec 32) (_ BitVec 32) V!15853 V!15853 (_ BitVec 32) Int) ListLongMap!6233)

(assert (=> b!425234 (= lt!194584 (getCurrentListMapNoExtraKeys!1336 lt!194588 lt!194585 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25963)

(declare-fun v!412 () V!15853)

(assert (=> b!425234 (= lt!194585 (array!25964 (store (arr!12431 _values!549) i!563 (ValueCellFull!5187 v!412)) (size!12783 _values!549)))))

(declare-fun lt!194587 () ListLongMap!6233)

(assert (=> b!425234 (= lt!194587 (getCurrentListMapNoExtraKeys!1336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!248922 () Bool)

(assert (=> start!39642 (=> (not res!248922) (not e!252471))))

(assert (=> start!39642 (= res!248922 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12782 _keys!709))))))

(assert (=> start!39642 e!252471))

(declare-fun tp_is_empty!11061 () Bool)

(assert (=> start!39642 tp_is_empty!11061))

(assert (=> start!39642 tp!35255))

(assert (=> start!39642 true))

(declare-fun e!252472 () Bool)

(declare-fun array_inv!9056 (array!25963) Bool)

(assert (=> start!39642 (and (array_inv!9056 _values!549) e!252472)))

(declare-fun array_inv!9057 (array!25961) Bool)

(assert (=> start!39642 (array_inv!9057 _keys!709)))

(declare-fun b!425235 () Bool)

(declare-fun res!248926 () Bool)

(assert (=> b!425235 (=> (not res!248926) (not e!252471))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425235 (= res!248926 (validKeyInArray!0 k0!794))))

(declare-fun b!425236 () Bool)

(assert (=> b!425236 (= e!252477 (not true))))

(declare-fun +!1290 (ListLongMap!6233 tuple2!7320) ListLongMap!6233)

(assert (=> b!425236 (= (getCurrentListMapNoExtraKeys!1336 lt!194588 lt!194585 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1290 (getCurrentListMapNoExtraKeys!1336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7321 k0!794 v!412)))))

(declare-datatypes ((Unit!12482 0))(
  ( (Unit!12483) )
))
(declare-fun lt!194586 () Unit!12482)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!485 (array!25961 array!25963 (_ BitVec 32) (_ BitVec 32) V!15853 V!15853 (_ BitVec 32) (_ BitVec 64) V!15853 (_ BitVec 32) Int) Unit!12482)

(assert (=> b!425236 (= lt!194586 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18213 () Bool)

(declare-fun tp!35256 () Bool)

(declare-fun e!252473 () Bool)

(assert (=> mapNonEmpty!18213 (= mapRes!18213 (and tp!35256 e!252473))))

(declare-fun mapRest!18213 () (Array (_ BitVec 32) ValueCell!5187))

(declare-fun mapValue!18213 () ValueCell!5187)

(declare-fun mapKey!18213 () (_ BitVec 32))

(assert (=> mapNonEmpty!18213 (= (arr!12431 _values!549) (store mapRest!18213 mapKey!18213 mapValue!18213))))

(declare-fun b!425237 () Bool)

(declare-fun res!248927 () Bool)

(assert (=> b!425237 (=> (not res!248927) (not e!252471))))

(assert (=> b!425237 (= res!248927 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12782 _keys!709))))))

(declare-fun b!425238 () Bool)

(assert (=> b!425238 (= e!252473 tp_is_empty!11061)))

(declare-fun b!425239 () Bool)

(declare-fun res!248918 () Bool)

(assert (=> b!425239 (=> (not res!248918) (not e!252471))))

(assert (=> b!425239 (= res!248918 (and (= (size!12783 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12782 _keys!709) (size!12783 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425240 () Bool)

(declare-fun e!252476 () Bool)

(assert (=> b!425240 (= e!252472 (and e!252476 mapRes!18213))))

(declare-fun condMapEmpty!18213 () Bool)

(declare-fun mapDefault!18213 () ValueCell!5187)

(assert (=> b!425240 (= condMapEmpty!18213 (= (arr!12431 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5187)) mapDefault!18213)))))

(declare-fun b!425241 () Bool)

(assert (=> b!425241 (= e!252476 tp_is_empty!11061)))

(declare-fun b!425242 () Bool)

(declare-fun res!248925 () Bool)

(assert (=> b!425242 (=> (not res!248925) (not e!252471))))

(assert (=> b!425242 (= res!248925 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7329))))

(declare-fun b!425243 () Bool)

(declare-fun res!248916 () Bool)

(assert (=> b!425243 (=> (not res!248916) (not e!252471))))

(declare-fun arrayContainsKey!0 (array!25961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425243 (= res!248916 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425244 () Bool)

(assert (=> b!425244 (= e!252471 e!252474)))

(declare-fun res!248919 () Bool)

(assert (=> b!425244 (=> (not res!248919) (not e!252474))))

(assert (=> b!425244 (= res!248919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194588 mask!1025))))

(assert (=> b!425244 (= lt!194588 (array!25962 (store (arr!12430 _keys!709) i!563 k0!794) (size!12782 _keys!709)))))

(declare-fun b!425245 () Bool)

(declare-fun res!248921 () Bool)

(assert (=> b!425245 (=> (not res!248921) (not e!252471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425245 (= res!248921 (validMask!0 mask!1025))))

(declare-fun b!425246 () Bool)

(declare-fun res!248923 () Bool)

(assert (=> b!425246 (=> (not res!248923) (not e!252474))))

(assert (=> b!425246 (= res!248923 (bvsle from!863 i!563))))

(assert (= (and start!39642 res!248922) b!425245))

(assert (= (and b!425245 res!248921) b!425239))

(assert (= (and b!425239 res!248918) b!425232))

(assert (= (and b!425232 res!248920) b!425242))

(assert (= (and b!425242 res!248925) b!425237))

(assert (= (and b!425237 res!248927) b!425235))

(assert (= (and b!425235 res!248926) b!425233))

(assert (= (and b!425233 res!248924) b!425243))

(assert (= (and b!425243 res!248916) b!425244))

(assert (= (and b!425244 res!248919) b!425231))

(assert (= (and b!425231 res!248928) b!425246))

(assert (= (and b!425246 res!248923) b!425234))

(assert (= (and b!425234 res!248917) b!425236))

(assert (= (and b!425240 condMapEmpty!18213) mapIsEmpty!18213))

(assert (= (and b!425240 (not condMapEmpty!18213)) mapNonEmpty!18213))

(get-info :version)

(assert (= (and mapNonEmpty!18213 ((_ is ValueCellFull!5187) mapValue!18213)) b!425238))

(assert (= (and b!425240 ((_ is ValueCellFull!5187) mapDefault!18213)) b!425241))

(assert (= start!39642 b!425240))

(declare-fun m!414173 () Bool)

(assert (=> b!425231 m!414173))

(declare-fun m!414175 () Bool)

(assert (=> b!425245 m!414175))

(declare-fun m!414177 () Bool)

(assert (=> b!425233 m!414177))

(declare-fun m!414179 () Bool)

(assert (=> b!425236 m!414179))

(declare-fun m!414181 () Bool)

(assert (=> b!425236 m!414181))

(assert (=> b!425236 m!414181))

(declare-fun m!414183 () Bool)

(assert (=> b!425236 m!414183))

(declare-fun m!414185 () Bool)

(assert (=> b!425236 m!414185))

(declare-fun m!414187 () Bool)

(assert (=> b!425232 m!414187))

(declare-fun m!414189 () Bool)

(assert (=> start!39642 m!414189))

(declare-fun m!414191 () Bool)

(assert (=> start!39642 m!414191))

(declare-fun m!414193 () Bool)

(assert (=> b!425242 m!414193))

(declare-fun m!414195 () Bool)

(assert (=> b!425234 m!414195))

(declare-fun m!414197 () Bool)

(assert (=> b!425234 m!414197))

(declare-fun m!414199 () Bool)

(assert (=> b!425234 m!414199))

(declare-fun m!414201 () Bool)

(assert (=> b!425244 m!414201))

(declare-fun m!414203 () Bool)

(assert (=> b!425244 m!414203))

(declare-fun m!414205 () Bool)

(assert (=> b!425243 m!414205))

(declare-fun m!414207 () Bool)

(assert (=> b!425235 m!414207))

(declare-fun m!414209 () Bool)

(assert (=> mapNonEmpty!18213 m!414209))

(check-sat tp_is_empty!11061 (not mapNonEmpty!18213) (not b_next!9909) (not b!425243) (not b!425242) (not b!425245) (not b!425231) (not start!39642) (not b!425235) (not b!425232) (not b!425236) (not b!425234) b_and!17565 (not b!425244))
(check-sat b_and!17565 (not b_next!9909))
