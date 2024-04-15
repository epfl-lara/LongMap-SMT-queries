; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38420 () Bool)

(assert start!38420)

(declare-fun b!396088 () Bool)

(declare-fun res!227241 () Bool)

(declare-fun e!239686 () Bool)

(assert (=> b!396088 (=> (not res!227241) (not e!239686))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23605 0))(
  ( (array!23606 (arr!11252 (Array (_ BitVec 32) (_ BitVec 64))) (size!11605 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23605)

(assert (=> b!396088 (= res!227241 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11605 _keys!709))))))

(declare-fun b!396089 () Bool)

(declare-fun res!227250 () Bool)

(assert (=> b!396089 (=> (not res!227250) (not e!239686))))

(declare-datatypes ((List!6485 0))(
  ( (Nil!6482) (Cons!6481 (h!7337 (_ BitVec 64)) (t!11650 List!6485)) )
))
(declare-fun arrayNoDuplicates!0 (array!23605 (_ BitVec 32) List!6485) Bool)

(assert (=> b!396089 (= res!227250 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6482))))

(declare-fun b!396090 () Bool)

(declare-fun e!239684 () Bool)

(declare-fun tp_is_empty!9853 () Bool)

(assert (=> b!396090 (= e!239684 tp_is_empty!9853)))

(declare-fun b!396091 () Bool)

(declare-fun res!227245 () Bool)

(assert (=> b!396091 (=> (not res!227245) (not e!239686))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396091 (= res!227245 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16401 () Bool)

(declare-fun mapRes!16401 () Bool)

(declare-fun tp!32196 () Bool)

(assert (=> mapNonEmpty!16401 (= mapRes!16401 (and tp!32196 e!239684))))

(declare-datatypes ((V!14243 0))(
  ( (V!14244 (val!4971 Int)) )
))
(declare-datatypes ((ValueCell!4583 0))(
  ( (ValueCellFull!4583 (v!7212 V!14243)) (EmptyCell!4583) )
))
(declare-fun mapValue!16401 () ValueCell!4583)

(declare-datatypes ((array!23607 0))(
  ( (array!23608 (arr!11253 (Array (_ BitVec 32) ValueCell!4583)) (size!11606 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23607)

(declare-fun mapKey!16401 () (_ BitVec 32))

(declare-fun mapRest!16401 () (Array (_ BitVec 32) ValueCell!4583))

(assert (=> mapNonEmpty!16401 (= (arr!11253 _values!549) (store mapRest!16401 mapKey!16401 mapValue!16401))))

(declare-fun res!227249 () Bool)

(assert (=> start!38420 (=> (not res!227249) (not e!239686))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38420 (= res!227249 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11605 _keys!709))))))

(assert (=> start!38420 e!239686))

(assert (=> start!38420 true))

(declare-fun e!239687 () Bool)

(declare-fun array_inv!8256 (array!23607) Bool)

(assert (=> start!38420 (and (array_inv!8256 _values!549) e!239687)))

(declare-fun array_inv!8257 (array!23605) Bool)

(assert (=> start!38420 (array_inv!8257 _keys!709)))

(declare-fun b!396092 () Bool)

(declare-fun res!227243 () Bool)

(assert (=> b!396092 (=> (not res!227243) (not e!239686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396092 (= res!227243 (validKeyInArray!0 k0!794))))

(declare-fun b!396093 () Bool)

(declare-fun res!227248 () Bool)

(assert (=> b!396093 (=> (not res!227248) (not e!239686))))

(assert (=> b!396093 (= res!227248 (or (= (select (arr!11252 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11252 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16401 () Bool)

(assert (=> mapIsEmpty!16401 mapRes!16401))

(declare-fun b!396094 () Bool)

(declare-fun res!227244 () Bool)

(assert (=> b!396094 (=> (not res!227244) (not e!239686))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396094 (= res!227244 (validMask!0 mask!1025))))

(declare-fun b!396095 () Bool)

(declare-fun e!239685 () Bool)

(assert (=> b!396095 (= e!239685 false)))

(declare-fun lt!186905 () Bool)

(declare-fun lt!186904 () array!23605)

(assert (=> b!396095 (= lt!186905 (arrayNoDuplicates!0 lt!186904 #b00000000000000000000000000000000 Nil!6482))))

(declare-fun b!396096 () Bool)

(declare-fun res!227246 () Bool)

(assert (=> b!396096 (=> (not res!227246) (not e!239686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23605 (_ BitVec 32)) Bool)

(assert (=> b!396096 (= res!227246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396097 () Bool)

(assert (=> b!396097 (= e!239686 e!239685)))

(declare-fun res!227247 () Bool)

(assert (=> b!396097 (=> (not res!227247) (not e!239685))))

(assert (=> b!396097 (= res!227247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186904 mask!1025))))

(assert (=> b!396097 (= lt!186904 (array!23606 (store (arr!11252 _keys!709) i!563 k0!794) (size!11605 _keys!709)))))

(declare-fun b!396098 () Bool)

(declare-fun e!239688 () Bool)

(assert (=> b!396098 (= e!239687 (and e!239688 mapRes!16401))))

(declare-fun condMapEmpty!16401 () Bool)

(declare-fun mapDefault!16401 () ValueCell!4583)

(assert (=> b!396098 (= condMapEmpty!16401 (= (arr!11253 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4583)) mapDefault!16401)))))

(declare-fun b!396099 () Bool)

(declare-fun res!227242 () Bool)

(assert (=> b!396099 (=> (not res!227242) (not e!239686))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396099 (= res!227242 (and (= (size!11606 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11605 _keys!709) (size!11606 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396100 () Bool)

(assert (=> b!396100 (= e!239688 tp_is_empty!9853)))

(assert (= (and start!38420 res!227249) b!396094))

(assert (= (and b!396094 res!227244) b!396099))

(assert (= (and b!396099 res!227242) b!396096))

(assert (= (and b!396096 res!227246) b!396089))

(assert (= (and b!396089 res!227250) b!396088))

(assert (= (and b!396088 res!227241) b!396092))

(assert (= (and b!396092 res!227243) b!396093))

(assert (= (and b!396093 res!227248) b!396091))

(assert (= (and b!396091 res!227245) b!396097))

(assert (= (and b!396097 res!227247) b!396095))

(assert (= (and b!396098 condMapEmpty!16401) mapIsEmpty!16401))

(assert (= (and b!396098 (not condMapEmpty!16401)) mapNonEmpty!16401))

(get-info :version)

(assert (= (and mapNonEmpty!16401 ((_ is ValueCellFull!4583) mapValue!16401)) b!396090))

(assert (= (and b!396098 ((_ is ValueCellFull!4583) mapDefault!16401)) b!396100))

(assert (= start!38420 b!396098))

(declare-fun m!391299 () Bool)

(assert (=> mapNonEmpty!16401 m!391299))

(declare-fun m!391301 () Bool)

(assert (=> start!38420 m!391301))

(declare-fun m!391303 () Bool)

(assert (=> start!38420 m!391303))

(declare-fun m!391305 () Bool)

(assert (=> b!396089 m!391305))

(declare-fun m!391307 () Bool)

(assert (=> b!396096 m!391307))

(declare-fun m!391309 () Bool)

(assert (=> b!396094 m!391309))

(declare-fun m!391311 () Bool)

(assert (=> b!396092 m!391311))

(declare-fun m!391313 () Bool)

(assert (=> b!396095 m!391313))

(declare-fun m!391315 () Bool)

(assert (=> b!396091 m!391315))

(declare-fun m!391317 () Bool)

(assert (=> b!396097 m!391317))

(declare-fun m!391319 () Bool)

(assert (=> b!396097 m!391319))

(declare-fun m!391321 () Bool)

(assert (=> b!396093 m!391321))

(check-sat (not b!396096) (not b!396094) (not b!396091) (not b!396097) (not b!396089) (not start!38420) (not b!396095) tp_is_empty!9853 (not b!396092) (not mapNonEmpty!16401))
(check-sat)
