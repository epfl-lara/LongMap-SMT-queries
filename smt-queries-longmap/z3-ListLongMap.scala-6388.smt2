; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82094 () Bool)

(assert start!82094)

(declare-fun b!956981 () Bool)

(declare-fun e!539362 () Bool)

(declare-datatypes ((List!19513 0))(
  ( (Nil!19510) (Cons!19509 (h!20671 (_ BitVec 64)) (t!27867 List!19513)) )
))
(declare-fun contains!5279 (List!19513 (_ BitVec 64)) Bool)

(assert (=> b!956981 (= e!539362 (contains!5279 Nil!19510 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!640701 () Bool)

(declare-fun e!539365 () Bool)

(assert (=> start!82094 (=> (not res!640701) (not e!539365))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82094 (= res!640701 (validMask!0 mask!2088))))

(assert (=> start!82094 e!539365))

(assert (=> start!82094 true))

(declare-datatypes ((V!33121 0))(
  ( (V!33122 (val!10602 Int)) )
))
(declare-datatypes ((ValueCell!10070 0))(
  ( (ValueCellFull!10070 (v!13157 V!33121)) (EmptyCell!10070) )
))
(declare-datatypes ((array!58250 0))(
  ( (array!58251 (arr!28000 (Array (_ BitVec 32) ValueCell!10070)) (size!28481 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58250)

(declare-fun e!539364 () Bool)

(declare-fun array_inv!21781 (array!58250) Bool)

(assert (=> start!82094 (and (array_inv!21781 _values!1386) e!539364)))

(declare-datatypes ((array!58252 0))(
  ( (array!58253 (arr!28001 (Array (_ BitVec 32) (_ BitVec 64))) (size!28482 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58252)

(declare-fun array_inv!21782 (array!58252) Bool)

(assert (=> start!82094 (array_inv!21782 _keys!1668)))

(declare-fun b!956982 () Bool)

(declare-fun res!640699 () Bool)

(assert (=> b!956982 (=> (not res!640699) (not e!539365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58252 (_ BitVec 32)) Bool)

(assert (=> b!956982 (= res!640699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33631 () Bool)

(declare-fun mapRes!33631 () Bool)

(assert (=> mapIsEmpty!33631 mapRes!33631))

(declare-fun b!956983 () Bool)

(declare-fun e!539367 () Bool)

(assert (=> b!956983 (= e!539364 (and e!539367 mapRes!33631))))

(declare-fun condMapEmpty!33631 () Bool)

(declare-fun mapDefault!33631 () ValueCell!10070)

(assert (=> b!956983 (= condMapEmpty!33631 (= (arr!28000 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10070)) mapDefault!33631)))))

(declare-fun b!956984 () Bool)

(declare-fun res!640702 () Bool)

(assert (=> b!956984 (=> (not res!640702) (not e!539365))))

(declare-fun noDuplicate!1373 (List!19513) Bool)

(assert (=> b!956984 (= res!640702 (noDuplicate!1373 Nil!19510))))

(declare-fun b!956985 () Bool)

(declare-fun res!640698 () Bool)

(assert (=> b!956985 (=> (not res!640698) (not e!539365))))

(assert (=> b!956985 (= res!640698 (and (bvsle #b00000000000000000000000000000000 (size!28482 _keys!1668)) (bvslt (size!28482 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!956986 () Bool)

(assert (=> b!956986 (= e!539365 e!539362)))

(declare-fun res!640700 () Bool)

(assert (=> b!956986 (=> res!640700 e!539362)))

(assert (=> b!956986 (= res!640700 (contains!5279 Nil!19510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!956987 () Bool)

(declare-fun tp_is_empty!21103 () Bool)

(assert (=> b!956987 (= e!539367 tp_is_empty!21103)))

(declare-fun b!956988 () Bool)

(declare-fun res!640697 () Bool)

(assert (=> b!956988 (=> (not res!640697) (not e!539365))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!956988 (= res!640697 (and (= (size!28481 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28482 _keys!1668) (size!28481 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33631 () Bool)

(declare-fun tp!64237 () Bool)

(declare-fun e!539366 () Bool)

(assert (=> mapNonEmpty!33631 (= mapRes!33631 (and tp!64237 e!539366))))

(declare-fun mapValue!33631 () ValueCell!10070)

(declare-fun mapRest!33631 () (Array (_ BitVec 32) ValueCell!10070))

(declare-fun mapKey!33631 () (_ BitVec 32))

(assert (=> mapNonEmpty!33631 (= (arr!28000 _values!1386) (store mapRest!33631 mapKey!33631 mapValue!33631))))

(declare-fun b!956989 () Bool)

(assert (=> b!956989 (= e!539366 tp_is_empty!21103)))

(assert (= (and start!82094 res!640701) b!956988))

(assert (= (and b!956988 res!640697) b!956982))

(assert (= (and b!956982 res!640699) b!956985))

(assert (= (and b!956985 res!640698) b!956984))

(assert (= (and b!956984 res!640702) b!956986))

(assert (= (and b!956986 (not res!640700)) b!956981))

(assert (= (and b!956983 condMapEmpty!33631) mapIsEmpty!33631))

(assert (= (and b!956983 (not condMapEmpty!33631)) mapNonEmpty!33631))

(get-info :version)

(assert (= (and mapNonEmpty!33631 ((_ is ValueCellFull!10070) mapValue!33631)) b!956989))

(assert (= (and b!956983 ((_ is ValueCellFull!10070) mapDefault!33631)) b!956987))

(assert (= start!82094 b!956983))

(declare-fun m!887507 () Bool)

(assert (=> b!956982 m!887507))

(declare-fun m!887509 () Bool)

(assert (=> b!956986 m!887509))

(declare-fun m!887511 () Bool)

(assert (=> b!956981 m!887511))

(declare-fun m!887513 () Bool)

(assert (=> mapNonEmpty!33631 m!887513))

(declare-fun m!887515 () Bool)

(assert (=> start!82094 m!887515))

(declare-fun m!887517 () Bool)

(assert (=> start!82094 m!887517))

(declare-fun m!887519 () Bool)

(assert (=> start!82094 m!887519))

(declare-fun m!887521 () Bool)

(assert (=> b!956984 m!887521))

(check-sat (not b!956982) tp_is_empty!21103 (not mapNonEmpty!33631) (not b!956986) (not b!956984) (not start!82094) (not b!956981))
(check-sat)
(get-model)

(declare-fun b!957052 () Bool)

(declare-fun e!539410 () Bool)

(declare-fun call!41691 () Bool)

(assert (=> b!957052 (= e!539410 call!41691)))

(declare-fun b!957053 () Bool)

(declare-fun e!539411 () Bool)

(assert (=> b!957053 (= e!539410 e!539411)))

(declare-fun lt!430062 () (_ BitVec 64))

(assert (=> b!957053 (= lt!430062 (select (arr!28001 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32018 0))(
  ( (Unit!32019) )
))
(declare-fun lt!430060 () Unit!32018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58252 (_ BitVec 64) (_ BitVec 32)) Unit!32018)

(assert (=> b!957053 (= lt!430060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430062 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957053 (arrayContainsKey!0 _keys!1668 lt!430062 #b00000000000000000000000000000000)))

(declare-fun lt!430061 () Unit!32018)

(assert (=> b!957053 (= lt!430061 lt!430060)))

(declare-fun res!640743 () Bool)

(declare-datatypes ((SeekEntryResult!9187 0))(
  ( (MissingZero!9187 (index!39119 (_ BitVec 32))) (Found!9187 (index!39120 (_ BitVec 32))) (Intermediate!9187 (undefined!9999 Bool) (index!39121 (_ BitVec 32)) (x!82500 (_ BitVec 32))) (Undefined!9187) (MissingVacant!9187 (index!39122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58252 (_ BitVec 32)) SeekEntryResult!9187)

(assert (=> b!957053 (= res!640743 (= (seekEntryOrOpen!0 (select (arr!28001 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9187 #b00000000000000000000000000000000)))))

(assert (=> b!957053 (=> (not res!640743) (not e!539411))))

(declare-fun b!957054 () Bool)

(declare-fun e!539412 () Bool)

(assert (=> b!957054 (= e!539412 e!539410)))

(declare-fun c!99840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957054 (= c!99840 (validKeyInArray!0 (select (arr!28001 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun d!115705 () Bool)

(declare-fun res!640744 () Bool)

(assert (=> d!115705 (=> res!640744 e!539412)))

(assert (=> d!115705 (= res!640744 (bvsge #b00000000000000000000000000000000 (size!28482 _keys!1668)))))

(assert (=> d!115705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539412)))

(declare-fun b!957055 () Bool)

(assert (=> b!957055 (= e!539411 call!41691)))

(declare-fun bm!41688 () Bool)

(assert (=> bm!41688 (= call!41691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(assert (= (and d!115705 (not res!640744)) b!957054))

(assert (= (and b!957054 c!99840) b!957053))

(assert (= (and b!957054 (not c!99840)) b!957052))

(assert (= (and b!957053 res!640743) b!957055))

(assert (= (or b!957055 b!957052) bm!41688))

(declare-fun m!887555 () Bool)

(assert (=> b!957053 m!887555))

(declare-fun m!887557 () Bool)

(assert (=> b!957053 m!887557))

(declare-fun m!887559 () Bool)

(assert (=> b!957053 m!887559))

(assert (=> b!957053 m!887555))

(declare-fun m!887561 () Bool)

(assert (=> b!957053 m!887561))

(assert (=> b!957054 m!887555))

(assert (=> b!957054 m!887555))

(declare-fun m!887563 () Bool)

(assert (=> b!957054 m!887563))

(declare-fun m!887565 () Bool)

(assert (=> bm!41688 m!887565))

(assert (=> b!956982 d!115705))

(declare-fun d!115707 () Bool)

(declare-fun lt!430065 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!411 (List!19513) (InoxSet (_ BitVec 64)))

(assert (=> d!115707 (= lt!430065 (select (content!411 Nil!19510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!539417 () Bool)

(assert (=> d!115707 (= lt!430065 e!539417)))

(declare-fun res!640750 () Bool)

(assert (=> d!115707 (=> (not res!640750) (not e!539417))))

(assert (=> d!115707 (= res!640750 ((_ is Cons!19509) Nil!19510))))

(assert (=> d!115707 (= (contains!5279 Nil!19510 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430065)))

(declare-fun b!957060 () Bool)

(declare-fun e!539418 () Bool)

(assert (=> b!957060 (= e!539417 e!539418)))

(declare-fun res!640749 () Bool)

(assert (=> b!957060 (=> res!640749 e!539418)))

(assert (=> b!957060 (= res!640749 (= (h!20671 Nil!19510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957061 () Bool)

(assert (=> b!957061 (= e!539418 (contains!5279 (t!27867 Nil!19510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115707 res!640750) b!957060))

(assert (= (and b!957060 (not res!640749)) b!957061))

(declare-fun m!887567 () Bool)

(assert (=> d!115707 m!887567))

(declare-fun m!887569 () Bool)

(assert (=> d!115707 m!887569))

(declare-fun m!887571 () Bool)

(assert (=> b!957061 m!887571))

(assert (=> b!956986 d!115707))

(declare-fun d!115709 () Bool)

(declare-fun lt!430066 () Bool)

(assert (=> d!115709 (= lt!430066 (select (content!411 Nil!19510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!539419 () Bool)

(assert (=> d!115709 (= lt!430066 e!539419)))

(declare-fun res!640752 () Bool)

(assert (=> d!115709 (=> (not res!640752) (not e!539419))))

(assert (=> d!115709 (= res!640752 ((_ is Cons!19509) Nil!19510))))

(assert (=> d!115709 (= (contains!5279 Nil!19510 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430066)))

(declare-fun b!957062 () Bool)

(declare-fun e!539420 () Bool)

(assert (=> b!957062 (= e!539419 e!539420)))

(declare-fun res!640751 () Bool)

(assert (=> b!957062 (=> res!640751 e!539420)))

(assert (=> b!957062 (= res!640751 (= (h!20671 Nil!19510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957063 () Bool)

(assert (=> b!957063 (= e!539420 (contains!5279 (t!27867 Nil!19510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115709 res!640752) b!957062))

(assert (= (and b!957062 (not res!640751)) b!957063))

(assert (=> d!115709 m!887567))

(declare-fun m!887573 () Bool)

(assert (=> d!115709 m!887573))

(declare-fun m!887575 () Bool)

(assert (=> b!957063 m!887575))

(assert (=> b!956981 d!115709))

(declare-fun d!115711 () Bool)

(declare-fun res!640757 () Bool)

(declare-fun e!539425 () Bool)

(assert (=> d!115711 (=> res!640757 e!539425)))

(assert (=> d!115711 (= res!640757 ((_ is Nil!19510) Nil!19510))))

(assert (=> d!115711 (= (noDuplicate!1373 Nil!19510) e!539425)))

(declare-fun b!957068 () Bool)

(declare-fun e!539426 () Bool)

(assert (=> b!957068 (= e!539425 e!539426)))

(declare-fun res!640758 () Bool)

(assert (=> b!957068 (=> (not res!640758) (not e!539426))))

(assert (=> b!957068 (= res!640758 (not (contains!5279 (t!27867 Nil!19510) (h!20671 Nil!19510))))))

(declare-fun b!957069 () Bool)

(assert (=> b!957069 (= e!539426 (noDuplicate!1373 (t!27867 Nil!19510)))))

(assert (= (and d!115711 (not res!640757)) b!957068))

(assert (= (and b!957068 res!640758) b!957069))

(declare-fun m!887577 () Bool)

(assert (=> b!957068 m!887577))

(declare-fun m!887579 () Bool)

(assert (=> b!957069 m!887579))

(assert (=> b!956984 d!115711))

(declare-fun d!115713 () Bool)

(assert (=> d!115713 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82094 d!115713))

(declare-fun d!115715 () Bool)

(assert (=> d!115715 (= (array_inv!21781 _values!1386) (bvsge (size!28481 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82094 d!115715))

(declare-fun d!115717 () Bool)

(assert (=> d!115717 (= (array_inv!21782 _keys!1668) (bvsge (size!28482 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82094 d!115717))

(declare-fun mapIsEmpty!33640 () Bool)

(declare-fun mapRes!33640 () Bool)

(assert (=> mapIsEmpty!33640 mapRes!33640))

(declare-fun b!957076 () Bool)

(declare-fun e!539432 () Bool)

(assert (=> b!957076 (= e!539432 tp_is_empty!21103)))

(declare-fun condMapEmpty!33640 () Bool)

(declare-fun mapDefault!33640 () ValueCell!10070)

(assert (=> mapNonEmpty!33631 (= condMapEmpty!33640 (= mapRest!33631 ((as const (Array (_ BitVec 32) ValueCell!10070)) mapDefault!33640)))))

(declare-fun e!539431 () Bool)

(assert (=> mapNonEmpty!33631 (= tp!64237 (and e!539431 mapRes!33640))))

(declare-fun b!957077 () Bool)

(assert (=> b!957077 (= e!539431 tp_is_empty!21103)))

(declare-fun mapNonEmpty!33640 () Bool)

(declare-fun tp!64246 () Bool)

(assert (=> mapNonEmpty!33640 (= mapRes!33640 (and tp!64246 e!539432))))

(declare-fun mapKey!33640 () (_ BitVec 32))

(declare-fun mapValue!33640 () ValueCell!10070)

(declare-fun mapRest!33640 () (Array (_ BitVec 32) ValueCell!10070))

(assert (=> mapNonEmpty!33640 (= mapRest!33631 (store mapRest!33640 mapKey!33640 mapValue!33640))))

(assert (= (and mapNonEmpty!33631 condMapEmpty!33640) mapIsEmpty!33640))

(assert (= (and mapNonEmpty!33631 (not condMapEmpty!33640)) mapNonEmpty!33640))

(assert (= (and mapNonEmpty!33640 ((_ is ValueCellFull!10070) mapValue!33640)) b!957076))

(assert (= (and mapNonEmpty!33631 ((_ is ValueCellFull!10070) mapDefault!33640)) b!957077))

(declare-fun m!887581 () Bool)

(assert (=> mapNonEmpty!33640 m!887581))

(check-sat tp_is_empty!21103 (not b!957053) (not d!115707) (not b!957061) (not mapNonEmpty!33640) (not bm!41688) (not b!957054) (not b!957063) (not b!957068) (not b!957069) (not d!115709))
(check-sat)
