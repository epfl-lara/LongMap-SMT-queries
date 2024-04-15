; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7352 () Bool)

(assert start!7352)

(declare-fun b!47126 () Bool)

(declare-fun res!27445 () Bool)

(declare-fun e!30148 () Bool)

(assert (=> b!47126 (=> (not res!27445) (not e!30148))))

(declare-datatypes ((array!3072 0))(
  ( (array!3073 (arr!1473 (Array (_ BitVec 32) (_ BitVec 64))) (size!1696 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3072)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3072 (_ BitVec 32)) Bool)

(assert (=> b!47126 (= res!27445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun res!27444 () Bool)

(assert (=> start!7352 (=> (not res!27444) (not e!30148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7352 (= res!27444 (validMask!0 mask!2458))))

(assert (=> start!7352 e!30148))

(assert (=> start!7352 true))

(declare-datatypes ((V!2423 0))(
  ( (V!2424 (val!1047 Int)) )
))
(declare-datatypes ((ValueCell!719 0))(
  ( (ValueCellFull!719 (v!2105 V!2423)) (EmptyCell!719) )
))
(declare-datatypes ((array!3074 0))(
  ( (array!3075 (arr!1474 (Array (_ BitVec 32) ValueCell!719)) (size!1697 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3074)

(declare-fun e!30151 () Bool)

(declare-fun array_inv!888 (array!3074) Bool)

(assert (=> start!7352 (and (array_inv!888 _values!1550) e!30151)))

(declare-fun array_inv!889 (array!3072) Bool)

(assert (=> start!7352 (array_inv!889 _keys!1940)))

(declare-fun mapIsEmpty!2060 () Bool)

(declare-fun mapRes!2060 () Bool)

(assert (=> mapIsEmpty!2060 mapRes!2060))

(declare-fun mapNonEmpty!2060 () Bool)

(declare-fun tp!6209 () Bool)

(declare-fun e!30149 () Bool)

(assert (=> mapNonEmpty!2060 (= mapRes!2060 (and tp!6209 e!30149))))

(declare-fun mapKey!2060 () (_ BitVec 32))

(declare-fun mapValue!2060 () ValueCell!719)

(declare-fun mapRest!2060 () (Array (_ BitVec 32) ValueCell!719))

(assert (=> mapNonEmpty!2060 (= (arr!1474 _values!1550) (store mapRest!2060 mapKey!2060 mapValue!2060))))

(declare-fun b!47127 () Bool)

(declare-fun e!30150 () Bool)

(assert (=> b!47127 (= e!30151 (and e!30150 mapRes!2060))))

(declare-fun condMapEmpty!2060 () Bool)

(declare-fun mapDefault!2060 () ValueCell!719)

(assert (=> b!47127 (= condMapEmpty!2060 (= (arr!1474 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!719)) mapDefault!2060)))))

(declare-fun b!47128 () Bool)

(declare-fun res!27443 () Bool)

(assert (=> b!47128 (=> (not res!27443) (not e!30148))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47128 (= res!27443 (and (= (size!1697 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1696 _keys!1940) (size!1697 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47129 () Bool)

(declare-fun tp_is_empty!2017 () Bool)

(assert (=> b!47129 (= e!30150 tp_is_empty!2017)))

(declare-fun b!47130 () Bool)

(assert (=> b!47130 (= e!30148 (and (bvsle #b00000000000000000000000000000000 (size!1696 _keys!1940)) (bvsge (size!1696 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47131 () Bool)

(assert (=> b!47131 (= e!30149 tp_is_empty!2017)))

(assert (= (and start!7352 res!27444) b!47128))

(assert (= (and b!47128 res!27443) b!47126))

(assert (= (and b!47126 res!27445) b!47130))

(assert (= (and b!47127 condMapEmpty!2060) mapIsEmpty!2060))

(assert (= (and b!47127 (not condMapEmpty!2060)) mapNonEmpty!2060))

(get-info :version)

(assert (= (and mapNonEmpty!2060 ((_ is ValueCellFull!719) mapValue!2060)) b!47131))

(assert (= (and b!47127 ((_ is ValueCellFull!719) mapDefault!2060)) b!47129))

(assert (= start!7352 b!47127))

(declare-fun m!41421 () Bool)

(assert (=> b!47126 m!41421))

(declare-fun m!41423 () Bool)

(assert (=> start!7352 m!41423))

(declare-fun m!41425 () Bool)

(assert (=> start!7352 m!41425))

(declare-fun m!41427 () Bool)

(assert (=> start!7352 m!41427))

(declare-fun m!41429 () Bool)

(assert (=> mapNonEmpty!2060 m!41429))

(check-sat (not start!7352) (not b!47126) (not mapNonEmpty!2060) tp_is_empty!2017)
(check-sat)
(get-model)

(declare-fun d!9399 () Bool)

(assert (=> d!9399 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7352 d!9399))

(declare-fun d!9401 () Bool)

(assert (=> d!9401 (= (array_inv!888 _values!1550) (bvsge (size!1697 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7352 d!9401))

(declare-fun d!9403 () Bool)

(assert (=> d!9403 (= (array_inv!889 _keys!1940) (bvsge (size!1696 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7352 d!9403))

(declare-fun b!47176 () Bool)

(declare-fun e!30189 () Bool)

(declare-fun e!30190 () Bool)

(assert (=> b!47176 (= e!30189 e!30190)))

(declare-fun lt!20380 () (_ BitVec 64))

(assert (=> b!47176 (= lt!20380 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1334 0))(
  ( (Unit!1335) )
))
(declare-fun lt!20381 () Unit!1334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3072 (_ BitVec 64) (_ BitVec 32)) Unit!1334)

(assert (=> b!47176 (= lt!20381 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20380 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47176 (arrayContainsKey!0 _keys!1940 lt!20380 #b00000000000000000000000000000000)))

(declare-fun lt!20382 () Unit!1334)

(assert (=> b!47176 (= lt!20382 lt!20381)))

(declare-fun res!27469 () Bool)

(declare-datatypes ((SeekEntryResult!209 0))(
  ( (MissingZero!209 (index!2958 (_ BitVec 32))) (Found!209 (index!2959 (_ BitVec 32))) (Intermediate!209 (undefined!1021 Bool) (index!2960 (_ BitVec 32)) (x!8728 (_ BitVec 32))) (Undefined!209) (MissingVacant!209 (index!2961 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3072 (_ BitVec 32)) SeekEntryResult!209)

(assert (=> b!47176 (= res!27469 (= (seekEntryOrOpen!0 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!209 #b00000000000000000000000000000000)))))

(assert (=> b!47176 (=> (not res!27469) (not e!30190))))

(declare-fun b!47177 () Bool)

(declare-fun e!30188 () Bool)

(assert (=> b!47177 (= e!30188 e!30189)))

(declare-fun c!6379 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47177 (= c!6379 (validKeyInArray!0 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun d!9405 () Bool)

(declare-fun res!27468 () Bool)

(assert (=> d!9405 (=> res!27468 e!30188)))

(assert (=> d!9405 (= res!27468 (bvsge #b00000000000000000000000000000000 (size!1696 _keys!1940)))))

(assert (=> d!9405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30188)))

(declare-fun b!47178 () Bool)

(declare-fun call!3714 () Bool)

(assert (=> b!47178 (= e!30189 call!3714)))

(declare-fun b!47179 () Bool)

(assert (=> b!47179 (= e!30190 call!3714)))

(declare-fun bm!3711 () Bool)

(assert (=> bm!3711 (= call!3714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9405 (not res!27468)) b!47177))

(assert (= (and b!47177 c!6379) b!47176))

(assert (= (and b!47177 (not c!6379)) b!47178))

(assert (= (and b!47176 res!27469) b!47179))

(assert (= (or b!47179 b!47178) bm!3711))

(declare-fun m!41451 () Bool)

(assert (=> b!47176 m!41451))

(declare-fun m!41453 () Bool)

(assert (=> b!47176 m!41453))

(declare-fun m!41455 () Bool)

(assert (=> b!47176 m!41455))

(assert (=> b!47176 m!41451))

(declare-fun m!41457 () Bool)

(assert (=> b!47176 m!41457))

(assert (=> b!47177 m!41451))

(assert (=> b!47177 m!41451))

(declare-fun m!41459 () Bool)

(assert (=> b!47177 m!41459))

(declare-fun m!41461 () Bool)

(assert (=> bm!3711 m!41461))

(assert (=> b!47126 d!9405))

(declare-fun condMapEmpty!2069 () Bool)

(declare-fun mapDefault!2069 () ValueCell!719)

(assert (=> mapNonEmpty!2060 (= condMapEmpty!2069 (= mapRest!2060 ((as const (Array (_ BitVec 32) ValueCell!719)) mapDefault!2069)))))

(declare-fun e!30195 () Bool)

(declare-fun mapRes!2069 () Bool)

(assert (=> mapNonEmpty!2060 (= tp!6209 (and e!30195 mapRes!2069))))

(declare-fun mapNonEmpty!2069 () Bool)

(declare-fun tp!6218 () Bool)

(declare-fun e!30196 () Bool)

(assert (=> mapNonEmpty!2069 (= mapRes!2069 (and tp!6218 e!30196))))

(declare-fun mapRest!2069 () (Array (_ BitVec 32) ValueCell!719))

(declare-fun mapKey!2069 () (_ BitVec 32))

(declare-fun mapValue!2069 () ValueCell!719)

(assert (=> mapNonEmpty!2069 (= mapRest!2060 (store mapRest!2069 mapKey!2069 mapValue!2069))))

(declare-fun b!47186 () Bool)

(assert (=> b!47186 (= e!30196 tp_is_empty!2017)))

(declare-fun mapIsEmpty!2069 () Bool)

(assert (=> mapIsEmpty!2069 mapRes!2069))

(declare-fun b!47187 () Bool)

(assert (=> b!47187 (= e!30195 tp_is_empty!2017)))

(assert (= (and mapNonEmpty!2060 condMapEmpty!2069) mapIsEmpty!2069))

(assert (= (and mapNonEmpty!2060 (not condMapEmpty!2069)) mapNonEmpty!2069))

(assert (= (and mapNonEmpty!2069 ((_ is ValueCellFull!719) mapValue!2069)) b!47186))

(assert (= (and mapNonEmpty!2060 ((_ is ValueCellFull!719) mapDefault!2069)) b!47187))

(declare-fun m!41463 () Bool)

(assert (=> mapNonEmpty!2069 m!41463))

(check-sat (not mapNonEmpty!2069) (not bm!3711) tp_is_empty!2017 (not b!47177) (not b!47176))
(check-sat)
