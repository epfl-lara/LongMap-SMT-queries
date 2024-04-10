; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82440 () Bool)

(assert start!82440)

(declare-fun mapIsEmpty!34093 () Bool)

(declare-fun mapRes!34093 () Bool)

(assert (=> mapIsEmpty!34093 mapRes!34093))

(declare-fun mapNonEmpty!34093 () Bool)

(declare-fun tp!65022 () Bool)

(declare-fun e!541833 () Bool)

(assert (=> mapNonEmpty!34093 (= mapRes!34093 (and tp!65022 e!541833))))

(declare-datatypes ((V!33523 0))(
  ( (V!33524 (val!10753 Int)) )
))
(declare-datatypes ((ValueCell!10221 0))(
  ( (ValueCellFull!10221 (v!13310 V!33523)) (EmptyCell!10221) )
))
(declare-datatypes ((array!58901 0))(
  ( (array!58902 (arr!28322 (Array (_ BitVec 32) ValueCell!10221)) (size!28801 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58901)

(declare-fun mapValue!34093 () ValueCell!10221)

(declare-fun mapRest!34093 () (Array (_ BitVec 32) ValueCell!10221))

(declare-fun mapKey!34093 () (_ BitVec 32))

(assert (=> mapNonEmpty!34093 (= (arr!28322 _values!1400) (store mapRest!34093 mapKey!34093 mapValue!34093))))

(declare-fun b!961092 () Bool)

(declare-fun e!541832 () Bool)

(declare-fun e!541834 () Bool)

(assert (=> b!961092 (= e!541832 (and e!541834 mapRes!34093))))

(declare-fun condMapEmpty!34093 () Bool)

(declare-fun mapDefault!34093 () ValueCell!10221)

(assert (=> b!961092 (= condMapEmpty!34093 (= (arr!28322 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10221)) mapDefault!34093)))))

(declare-fun b!961093 () Bool)

(declare-fun res!643286 () Bool)

(declare-fun e!541836 () Bool)

(assert (=> b!961093 (=> (not res!643286) (not e!541836))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!58903 0))(
  ( (array!58904 (arr!28323 (Array (_ BitVec 32) (_ BitVec 64))) (size!28802 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58903)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961093 (= res!643286 (and (= (size!28801 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28802 _keys!1686) (size!28801 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961094 () Bool)

(assert (=> b!961094 (= e!541836 (and (bvsle #b00000000000000000000000000000000 (size!28802 _keys!1686)) (bvsge (size!28802 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun res!643284 () Bool)

(assert (=> start!82440 (=> (not res!643284) (not e!541836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82440 (= res!643284 (validMask!0 mask!2110))))

(assert (=> start!82440 e!541836))

(assert (=> start!82440 true))

(declare-fun array_inv!21947 (array!58901) Bool)

(assert (=> start!82440 (and (array_inv!21947 _values!1400) e!541832)))

(declare-fun array_inv!21948 (array!58903) Bool)

(assert (=> start!82440 (array_inv!21948 _keys!1686)))

(declare-fun b!961095 () Bool)

(declare-fun tp_is_empty!21405 () Bool)

(assert (=> b!961095 (= e!541834 tp_is_empty!21405)))

(declare-fun b!961096 () Bool)

(declare-fun res!643285 () Bool)

(assert (=> b!961096 (=> (not res!643285) (not e!541836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58903 (_ BitVec 32)) Bool)

(assert (=> b!961096 (= res!643285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961097 () Bool)

(assert (=> b!961097 (= e!541833 tp_is_empty!21405)))

(assert (= (and start!82440 res!643284) b!961093))

(assert (= (and b!961093 res!643286) b!961096))

(assert (= (and b!961096 res!643285) b!961094))

(assert (= (and b!961092 condMapEmpty!34093) mapIsEmpty!34093))

(assert (= (and b!961092 (not condMapEmpty!34093)) mapNonEmpty!34093))

(get-info :version)

(assert (= (and mapNonEmpty!34093 ((_ is ValueCellFull!10221) mapValue!34093)) b!961097))

(assert (= (and b!961092 ((_ is ValueCellFull!10221) mapDefault!34093)) b!961095))

(assert (= start!82440 b!961092))

(declare-fun m!891169 () Bool)

(assert (=> mapNonEmpty!34093 m!891169))

(declare-fun m!891171 () Bool)

(assert (=> start!82440 m!891171))

(declare-fun m!891173 () Bool)

(assert (=> start!82440 m!891173))

(declare-fun m!891175 () Bool)

(assert (=> start!82440 m!891175))

(declare-fun m!891177 () Bool)

(assert (=> b!961096 m!891177))

(check-sat (not b!961096) (not start!82440) (not mapNonEmpty!34093) tp_is_empty!21405)
(check-sat)
(get-model)

(declare-fun b!961124 () Bool)

(declare-fun e!541860 () Bool)

(declare-fun e!541859 () Bool)

(assert (=> b!961124 (= e!541860 e!541859)))

(declare-fun lt!430714 () (_ BitVec 64))

(assert (=> b!961124 (= lt!430714 (select (arr!28323 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32207 0))(
  ( (Unit!32208) )
))
(declare-fun lt!430715 () Unit!32207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58903 (_ BitVec 64) (_ BitVec 32)) Unit!32207)

(assert (=> b!961124 (= lt!430715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430714 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961124 (arrayContainsKey!0 _keys!1686 lt!430714 #b00000000000000000000000000000000)))

(declare-fun lt!430716 () Unit!32207)

(assert (=> b!961124 (= lt!430716 lt!430715)))

(declare-fun res!643301 () Bool)

(declare-datatypes ((SeekEntryResult!9194 0))(
  ( (MissingZero!9194 (index!39147 (_ BitVec 32))) (Found!9194 (index!39148 (_ BitVec 32))) (Intermediate!9194 (undefined!10006 Bool) (index!39149 (_ BitVec 32)) (x!82918 (_ BitVec 32))) (Undefined!9194) (MissingVacant!9194 (index!39150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58903 (_ BitVec 32)) SeekEntryResult!9194)

(assert (=> b!961124 (= res!643301 (= (seekEntryOrOpen!0 (select (arr!28323 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9194 #b00000000000000000000000000000000)))))

(assert (=> b!961124 (=> (not res!643301) (not e!541859))))

(declare-fun b!961125 () Bool)

(declare-fun call!41723 () Bool)

(assert (=> b!961125 (= e!541860 call!41723)))

(declare-fun bm!41720 () Bool)

(assert (=> bm!41720 (= call!41723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun d!116031 () Bool)

(declare-fun res!643300 () Bool)

(declare-fun e!541858 () Bool)

(assert (=> d!116031 (=> res!643300 e!541858)))

(assert (=> d!116031 (= res!643300 (bvsge #b00000000000000000000000000000000 (size!28802 _keys!1686)))))

(assert (=> d!116031 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541858)))

(declare-fun b!961126 () Bool)

(assert (=> b!961126 (= e!541858 e!541860)))

(declare-fun c!99911 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961126 (= c!99911 (validKeyInArray!0 (select (arr!28323 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!961127 () Bool)

(assert (=> b!961127 (= e!541859 call!41723)))

(assert (= (and d!116031 (not res!643300)) b!961126))

(assert (= (and b!961126 c!99911) b!961124))

(assert (= (and b!961126 (not c!99911)) b!961125))

(assert (= (and b!961124 res!643301) b!961127))

(assert (= (or b!961127 b!961125) bm!41720))

(declare-fun m!891189 () Bool)

(assert (=> b!961124 m!891189))

(declare-fun m!891191 () Bool)

(assert (=> b!961124 m!891191))

(declare-fun m!891193 () Bool)

(assert (=> b!961124 m!891193))

(assert (=> b!961124 m!891189))

(declare-fun m!891195 () Bool)

(assert (=> b!961124 m!891195))

(declare-fun m!891197 () Bool)

(assert (=> bm!41720 m!891197))

(assert (=> b!961126 m!891189))

(assert (=> b!961126 m!891189))

(declare-fun m!891199 () Bool)

(assert (=> b!961126 m!891199))

(assert (=> b!961096 d!116031))

(declare-fun d!116033 () Bool)

(assert (=> d!116033 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82440 d!116033))

(declare-fun d!116035 () Bool)

(assert (=> d!116035 (= (array_inv!21947 _values!1400) (bvsge (size!28801 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82440 d!116035))

(declare-fun d!116037 () Bool)

(assert (=> d!116037 (= (array_inv!21948 _keys!1686) (bvsge (size!28802 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82440 d!116037))

(declare-fun condMapEmpty!34099 () Bool)

(declare-fun mapDefault!34099 () ValueCell!10221)

(assert (=> mapNonEmpty!34093 (= condMapEmpty!34099 (= mapRest!34093 ((as const (Array (_ BitVec 32) ValueCell!10221)) mapDefault!34099)))))

(declare-fun e!541866 () Bool)

(declare-fun mapRes!34099 () Bool)

(assert (=> mapNonEmpty!34093 (= tp!65022 (and e!541866 mapRes!34099))))

(declare-fun b!961134 () Bool)

(declare-fun e!541865 () Bool)

(assert (=> b!961134 (= e!541865 tp_is_empty!21405)))

(declare-fun mapNonEmpty!34099 () Bool)

(declare-fun tp!65028 () Bool)

(assert (=> mapNonEmpty!34099 (= mapRes!34099 (and tp!65028 e!541865))))

(declare-fun mapValue!34099 () ValueCell!10221)

(declare-fun mapRest!34099 () (Array (_ BitVec 32) ValueCell!10221))

(declare-fun mapKey!34099 () (_ BitVec 32))

(assert (=> mapNonEmpty!34099 (= mapRest!34093 (store mapRest!34099 mapKey!34099 mapValue!34099))))

(declare-fun b!961135 () Bool)

(assert (=> b!961135 (= e!541866 tp_is_empty!21405)))

(declare-fun mapIsEmpty!34099 () Bool)

(assert (=> mapIsEmpty!34099 mapRes!34099))

(assert (= (and mapNonEmpty!34093 condMapEmpty!34099) mapIsEmpty!34099))

(assert (= (and mapNonEmpty!34093 (not condMapEmpty!34099)) mapNonEmpty!34099))

(assert (= (and mapNonEmpty!34099 ((_ is ValueCellFull!10221) mapValue!34099)) b!961134))

(assert (= (and mapNonEmpty!34093 ((_ is ValueCellFull!10221) mapDefault!34099)) b!961135))

(declare-fun m!891201 () Bool)

(assert (=> mapNonEmpty!34099 m!891201))

(check-sat (not b!961126) (not mapNonEmpty!34099) tp_is_empty!21405 (not bm!41720) (not b!961124))
(check-sat)
