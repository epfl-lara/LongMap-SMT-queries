; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82280 () Bool)

(assert start!82280)

(declare-fun mapIsEmpty!33631 () Bool)

(declare-fun mapRes!33631 () Bool)

(assert (=> mapIsEmpty!33631 mapRes!33631))

(declare-fun b!958123 () Bool)

(declare-fun e!540097 () Bool)

(declare-datatypes ((List!19498 0))(
  ( (Nil!19495) (Cons!19494 (h!20662 (_ BitVec 64)) (t!27853 List!19498)) )
))
(declare-fun contains!5319 (List!19498 (_ BitVec 64)) Bool)

(assert (=> b!958123 (= e!540097 (contains!5319 Nil!19495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!958124 () Bool)

(declare-fun e!540095 () Bool)

(declare-fun tp_is_empty!21103 () Bool)

(assert (=> b!958124 (= e!540095 tp_is_empty!21103)))

(declare-fun b!958125 () Bool)

(declare-fun res!641155 () Bool)

(declare-fun e!540094 () Bool)

(assert (=> b!958125 (=> (not res!641155) (not e!540094))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58346 0))(
  ( (array!58347 (arr!28043 (Array (_ BitVec 32) (_ BitVec 64))) (size!28523 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58346)

(declare-datatypes ((V!33121 0))(
  ( (V!33122 (val!10602 Int)) )
))
(declare-datatypes ((ValueCell!10070 0))(
  ( (ValueCellFull!10070 (v!13155 V!33121)) (EmptyCell!10070) )
))
(declare-datatypes ((array!58348 0))(
  ( (array!58349 (arr!28044 (Array (_ BitVec 32) ValueCell!10070)) (size!28524 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58348)

(assert (=> b!958125 (= res!641155 (and (= (size!28524 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28523 _keys!1668) (size!28524 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33631 () Bool)

(declare-fun tp!64237 () Bool)

(assert (=> mapNonEmpty!33631 (= mapRes!33631 (and tp!64237 e!540095))))

(declare-fun mapKey!33631 () (_ BitVec 32))

(declare-fun mapValue!33631 () ValueCell!10070)

(declare-fun mapRest!33631 () (Array (_ BitVec 32) ValueCell!10070))

(assert (=> mapNonEmpty!33631 (= (arr!28044 _values!1386) (store mapRest!33631 mapKey!33631 mapValue!33631))))

(declare-fun b!958126 () Bool)

(declare-fun res!641156 () Bool)

(assert (=> b!958126 (=> (not res!641156) (not e!540094))))

(declare-fun noDuplicate!1373 (List!19498) Bool)

(assert (=> b!958126 (= res!641156 (noDuplicate!1373 Nil!19495))))

(declare-fun res!641153 () Bool)

(assert (=> start!82280 (=> (not res!641153) (not e!540094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82280 (= res!641153 (validMask!0 mask!2088))))

(assert (=> start!82280 e!540094))

(assert (=> start!82280 true))

(declare-fun e!540093 () Bool)

(declare-fun array_inv!21827 (array!58348) Bool)

(assert (=> start!82280 (and (array_inv!21827 _values!1386) e!540093)))

(declare-fun array_inv!21828 (array!58346) Bool)

(assert (=> start!82280 (array_inv!21828 _keys!1668)))

(declare-fun b!958127 () Bool)

(declare-fun e!540096 () Bool)

(assert (=> b!958127 (= e!540093 (and e!540096 mapRes!33631))))

(declare-fun condMapEmpty!33631 () Bool)

(declare-fun mapDefault!33631 () ValueCell!10070)

(assert (=> b!958127 (= condMapEmpty!33631 (= (arr!28044 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10070)) mapDefault!33631)))))

(declare-fun b!958128 () Bool)

(declare-fun res!641152 () Bool)

(assert (=> b!958128 (=> (not res!641152) (not e!540094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58346 (_ BitVec 32)) Bool)

(assert (=> b!958128 (= res!641152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958129 () Bool)

(assert (=> b!958129 (= e!540094 e!540097)))

(declare-fun res!641154 () Bool)

(assert (=> b!958129 (=> res!641154 e!540097)))

(assert (=> b!958129 (= res!641154 (contains!5319 Nil!19495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!958130 () Bool)

(assert (=> b!958130 (= e!540096 tp_is_empty!21103)))

(declare-fun b!958131 () Bool)

(declare-fun res!641151 () Bool)

(assert (=> b!958131 (=> (not res!641151) (not e!540094))))

(assert (=> b!958131 (= res!641151 (and (bvsle #b00000000000000000000000000000000 (size!28523 _keys!1668)) (bvslt (size!28523 _keys!1668) #b01111111111111111111111111111111)))))

(assert (= (and start!82280 res!641153) b!958125))

(assert (= (and b!958125 res!641155) b!958128))

(assert (= (and b!958128 res!641152) b!958131))

(assert (= (and b!958131 res!641151) b!958126))

(assert (= (and b!958126 res!641156) b!958129))

(assert (= (and b!958129 (not res!641154)) b!958123))

(assert (= (and b!958127 condMapEmpty!33631) mapIsEmpty!33631))

(assert (= (and b!958127 (not condMapEmpty!33631)) mapNonEmpty!33631))

(get-info :version)

(assert (= (and mapNonEmpty!33631 ((_ is ValueCellFull!10070) mapValue!33631)) b!958124))

(assert (= (and b!958127 ((_ is ValueCellFull!10070) mapDefault!33631)) b!958130))

(assert (= start!82280 b!958127))

(declare-fun m!889559 () Bool)

(assert (=> b!958128 m!889559))

(declare-fun m!889561 () Bool)

(assert (=> start!82280 m!889561))

(declare-fun m!889563 () Bool)

(assert (=> start!82280 m!889563))

(declare-fun m!889565 () Bool)

(assert (=> start!82280 m!889565))

(declare-fun m!889567 () Bool)

(assert (=> b!958126 m!889567))

(declare-fun m!889569 () Bool)

(assert (=> b!958129 m!889569))

(declare-fun m!889571 () Bool)

(assert (=> mapNonEmpty!33631 m!889571))

(declare-fun m!889573 () Bool)

(assert (=> b!958123 m!889573))

(check-sat (not b!958128) (not b!958126) tp_is_empty!21103 (not mapNonEmpty!33631) (not start!82280) (not b!958129) (not b!958123))
(check-sat)
(get-model)

(declare-fun d!116225 () Bool)

(declare-fun res!641197 () Bool)

(declare-fun e!540138 () Bool)

(assert (=> d!116225 (=> res!641197 e!540138)))

(assert (=> d!116225 (= res!641197 ((_ is Nil!19495) Nil!19495))))

(assert (=> d!116225 (= (noDuplicate!1373 Nil!19495) e!540138)))

(declare-fun b!958190 () Bool)

(declare-fun e!540139 () Bool)

(assert (=> b!958190 (= e!540138 e!540139)))

(declare-fun res!641198 () Bool)

(assert (=> b!958190 (=> (not res!641198) (not e!540139))))

(assert (=> b!958190 (= res!641198 (not (contains!5319 (t!27853 Nil!19495) (h!20662 Nil!19495))))))

(declare-fun b!958191 () Bool)

(assert (=> b!958191 (= e!540139 (noDuplicate!1373 (t!27853 Nil!19495)))))

(assert (= (and d!116225 (not res!641197)) b!958190))

(assert (= (and b!958190 res!641198) b!958191))

(declare-fun m!889607 () Bool)

(assert (=> b!958190 m!889607))

(declare-fun m!889609 () Bool)

(assert (=> b!958191 m!889609))

(assert (=> b!958126 d!116225))

(declare-fun d!116227 () Bool)

(declare-fun lt!430653 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!413 (List!19498) (InoxSet (_ BitVec 64)))

(assert (=> d!116227 (= lt!430653 (select (content!413 Nil!19495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!540144 () Bool)

(assert (=> d!116227 (= lt!430653 e!540144)))

(declare-fun res!641203 () Bool)

(assert (=> d!116227 (=> (not res!641203) (not e!540144))))

(assert (=> d!116227 (= res!641203 ((_ is Cons!19494) Nil!19495))))

(assert (=> d!116227 (= (contains!5319 Nil!19495 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430653)))

(declare-fun b!958196 () Bool)

(declare-fun e!540145 () Bool)

(assert (=> b!958196 (= e!540144 e!540145)))

(declare-fun res!641204 () Bool)

(assert (=> b!958196 (=> res!641204 e!540145)))

(assert (=> b!958196 (= res!641204 (= (h!20662 Nil!19495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!958197 () Bool)

(assert (=> b!958197 (= e!540145 (contains!5319 (t!27853 Nil!19495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116227 res!641203) b!958196))

(assert (= (and b!958196 (not res!641204)) b!958197))

(declare-fun m!889611 () Bool)

(assert (=> d!116227 m!889611))

(declare-fun m!889613 () Bool)

(assert (=> d!116227 m!889613))

(declare-fun m!889615 () Bool)

(assert (=> b!958197 m!889615))

(assert (=> b!958123 d!116227))

(declare-fun d!116229 () Bool)

(declare-fun res!641209 () Bool)

(declare-fun e!540152 () Bool)

(assert (=> d!116229 (=> res!641209 e!540152)))

(assert (=> d!116229 (= res!641209 (bvsge #b00000000000000000000000000000000 (size!28523 _keys!1668)))))

(assert (=> d!116229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!540152)))

(declare-fun b!958206 () Bool)

(declare-fun e!540154 () Bool)

(declare-fun call!41762 () Bool)

(assert (=> b!958206 (= e!540154 call!41762)))

(declare-fun b!958207 () Bool)

(declare-fun e!540153 () Bool)

(assert (=> b!958207 (= e!540153 e!540154)))

(declare-fun lt!430662 () (_ BitVec 64))

(assert (=> b!958207 (= lt!430662 (select (arr!28043 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32124 0))(
  ( (Unit!32125) )
))
(declare-fun lt!430661 () Unit!32124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58346 (_ BitVec 64) (_ BitVec 32)) Unit!32124)

(assert (=> b!958207 (= lt!430661 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430662 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!958207 (arrayContainsKey!0 _keys!1668 lt!430662 #b00000000000000000000000000000000)))

(declare-fun lt!430660 () Unit!32124)

(assert (=> b!958207 (= lt!430660 lt!430661)))

(declare-fun res!641210 () Bool)

(declare-datatypes ((SeekEntryResult!9147 0))(
  ( (MissingZero!9147 (index!38959 (_ BitVec 32))) (Found!9147 (index!38960 (_ BitVec 32))) (Intermediate!9147 (undefined!9959 Bool) (index!38961 (_ BitVec 32)) (x!82479 (_ BitVec 32))) (Undefined!9147) (MissingVacant!9147 (index!38962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58346 (_ BitVec 32)) SeekEntryResult!9147)

(assert (=> b!958207 (= res!641210 (= (seekEntryOrOpen!0 (select (arr!28043 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9147 #b00000000000000000000000000000000)))))

(assert (=> b!958207 (=> (not res!641210) (not e!540154))))

(declare-fun b!958208 () Bool)

(assert (=> b!958208 (= e!540153 call!41762)))

(declare-fun bm!41759 () Bool)

(assert (=> bm!41759 (= call!41762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!958209 () Bool)

(assert (=> b!958209 (= e!540152 e!540153)))

(declare-fun c!100187 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958209 (= c!100187 (validKeyInArray!0 (select (arr!28043 _keys!1668) #b00000000000000000000000000000000)))))

(assert (= (and d!116229 (not res!641209)) b!958209))

(assert (= (and b!958209 c!100187) b!958207))

(assert (= (and b!958209 (not c!100187)) b!958208))

(assert (= (and b!958207 res!641210) b!958206))

(assert (= (or b!958206 b!958208) bm!41759))

(declare-fun m!889617 () Bool)

(assert (=> b!958207 m!889617))

(declare-fun m!889619 () Bool)

(assert (=> b!958207 m!889619))

(declare-fun m!889621 () Bool)

(assert (=> b!958207 m!889621))

(assert (=> b!958207 m!889617))

(declare-fun m!889623 () Bool)

(assert (=> b!958207 m!889623))

(declare-fun m!889625 () Bool)

(assert (=> bm!41759 m!889625))

(assert (=> b!958209 m!889617))

(assert (=> b!958209 m!889617))

(declare-fun m!889627 () Bool)

(assert (=> b!958209 m!889627))

(assert (=> b!958128 d!116229))

(declare-fun d!116231 () Bool)

(declare-fun lt!430663 () Bool)

(assert (=> d!116231 (= lt!430663 (select (content!413 Nil!19495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!540155 () Bool)

(assert (=> d!116231 (= lt!430663 e!540155)))

(declare-fun res!641211 () Bool)

(assert (=> d!116231 (=> (not res!641211) (not e!540155))))

(assert (=> d!116231 (= res!641211 ((_ is Cons!19494) Nil!19495))))

(assert (=> d!116231 (= (contains!5319 Nil!19495 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430663)))

(declare-fun b!958210 () Bool)

(declare-fun e!540156 () Bool)

(assert (=> b!958210 (= e!540155 e!540156)))

(declare-fun res!641212 () Bool)

(assert (=> b!958210 (=> res!641212 e!540156)))

(assert (=> b!958210 (= res!641212 (= (h!20662 Nil!19495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!958211 () Bool)

(assert (=> b!958211 (= e!540156 (contains!5319 (t!27853 Nil!19495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116231 res!641211) b!958210))

(assert (= (and b!958210 (not res!641212)) b!958211))

(assert (=> d!116231 m!889611))

(declare-fun m!889629 () Bool)

(assert (=> d!116231 m!889629))

(declare-fun m!889631 () Bool)

(assert (=> b!958211 m!889631))

(assert (=> b!958129 d!116231))

(declare-fun d!116233 () Bool)

(assert (=> d!116233 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82280 d!116233))

(declare-fun d!116235 () Bool)

(assert (=> d!116235 (= (array_inv!21827 _values!1386) (bvsge (size!28524 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82280 d!116235))

(declare-fun d!116237 () Bool)

(assert (=> d!116237 (= (array_inv!21828 _keys!1668) (bvsge (size!28523 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82280 d!116237))

(declare-fun b!958218 () Bool)

(declare-fun e!540161 () Bool)

(assert (=> b!958218 (= e!540161 tp_is_empty!21103)))

(declare-fun mapNonEmpty!33640 () Bool)

(declare-fun mapRes!33640 () Bool)

(declare-fun tp!64246 () Bool)

(assert (=> mapNonEmpty!33640 (= mapRes!33640 (and tp!64246 e!540161))))

(declare-fun mapValue!33640 () ValueCell!10070)

(declare-fun mapKey!33640 () (_ BitVec 32))

(declare-fun mapRest!33640 () (Array (_ BitVec 32) ValueCell!10070))

(assert (=> mapNonEmpty!33640 (= mapRest!33631 (store mapRest!33640 mapKey!33640 mapValue!33640))))

(declare-fun condMapEmpty!33640 () Bool)

(declare-fun mapDefault!33640 () ValueCell!10070)

(assert (=> mapNonEmpty!33631 (= condMapEmpty!33640 (= mapRest!33631 ((as const (Array (_ BitVec 32) ValueCell!10070)) mapDefault!33640)))))

(declare-fun e!540162 () Bool)

(assert (=> mapNonEmpty!33631 (= tp!64237 (and e!540162 mapRes!33640))))

(declare-fun mapIsEmpty!33640 () Bool)

(assert (=> mapIsEmpty!33640 mapRes!33640))

(declare-fun b!958219 () Bool)

(assert (=> b!958219 (= e!540162 tp_is_empty!21103)))

(assert (= (and mapNonEmpty!33631 condMapEmpty!33640) mapIsEmpty!33640))

(assert (= (and mapNonEmpty!33631 (not condMapEmpty!33640)) mapNonEmpty!33640))

(assert (= (and mapNonEmpty!33640 ((_ is ValueCellFull!10070) mapValue!33640)) b!958218))

(assert (= (and mapNonEmpty!33631 ((_ is ValueCellFull!10070) mapDefault!33640)) b!958219))

(declare-fun m!889633 () Bool)

(assert (=> mapNonEmpty!33640 m!889633))

(check-sat (not b!958209) (not bm!41759) (not b!958191) (not b!958197) tp_is_empty!21103 (not d!116231) (not b!958211) (not b!958207) (not d!116227) (not mapNonEmpty!33640) (not b!958190))
(check-sat)
