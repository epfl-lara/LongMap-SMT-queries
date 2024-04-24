; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7356 () Bool)

(assert start!7356)

(declare-fun b!47135 () Bool)

(declare-fun res!27439 () Bool)

(declare-fun e!30156 () Bool)

(assert (=> b!47135 (=> (not res!27439) (not e!30156))))

(declare-datatypes ((array!3084 0))(
  ( (array!3085 (arr!1479 (Array (_ BitVec 32) (_ BitVec 64))) (size!1701 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3084)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3084 (_ BitVec 32)) Bool)

(assert (=> b!47135 (= res!27439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47136 () Bool)

(declare-fun e!30157 () Bool)

(declare-fun e!30153 () Bool)

(declare-fun mapRes!2060 () Bool)

(assert (=> b!47136 (= e!30157 (and e!30153 mapRes!2060))))

(declare-fun condMapEmpty!2060 () Bool)

(declare-datatypes ((V!2423 0))(
  ( (V!2424 (val!1047 Int)) )
))
(declare-datatypes ((ValueCell!719 0))(
  ( (ValueCellFull!719 (v!2108 V!2423)) (EmptyCell!719) )
))
(declare-datatypes ((array!3086 0))(
  ( (array!3087 (arr!1480 (Array (_ BitVec 32) ValueCell!719)) (size!1702 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3086)

(declare-fun mapDefault!2060 () ValueCell!719)

(assert (=> b!47136 (= condMapEmpty!2060 (= (arr!1480 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!719)) mapDefault!2060)))))

(declare-fun b!47137 () Bool)

(declare-fun e!30154 () Bool)

(declare-fun tp_is_empty!2017 () Bool)

(assert (=> b!47137 (= e!30154 tp_is_empty!2017)))

(declare-fun b!47138 () Bool)

(assert (=> b!47138 (= e!30156 (and (bvsle #b00000000000000000000000000000000 (size!1701 _keys!1940)) (bvsge (size!1701 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47139 () Bool)

(declare-fun res!27438 () Bool)

(assert (=> b!47139 (=> (not res!27438) (not e!30156))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47139 (= res!27438 (and (= (size!1702 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1701 _keys!1940) (size!1702 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47140 () Bool)

(assert (=> b!47140 (= e!30153 tp_is_empty!2017)))

(declare-fun mapNonEmpty!2060 () Bool)

(declare-fun tp!6209 () Bool)

(assert (=> mapNonEmpty!2060 (= mapRes!2060 (and tp!6209 e!30154))))

(declare-fun mapKey!2060 () (_ BitVec 32))

(declare-fun mapRest!2060 () (Array (_ BitVec 32) ValueCell!719))

(declare-fun mapValue!2060 () ValueCell!719)

(assert (=> mapNonEmpty!2060 (= (arr!1480 _values!1550) (store mapRest!2060 mapKey!2060 mapValue!2060))))

(declare-fun res!27440 () Bool)

(assert (=> start!7356 (=> (not res!27440) (not e!30156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7356 (= res!27440 (validMask!0 mask!2458))))

(assert (=> start!7356 e!30156))

(assert (=> start!7356 true))

(declare-fun array_inv!878 (array!3086) Bool)

(assert (=> start!7356 (and (array_inv!878 _values!1550) e!30157)))

(declare-fun array_inv!879 (array!3084) Bool)

(assert (=> start!7356 (array_inv!879 _keys!1940)))

(declare-fun mapIsEmpty!2060 () Bool)

(assert (=> mapIsEmpty!2060 mapRes!2060))

(assert (= (and start!7356 res!27440) b!47139))

(assert (= (and b!47139 res!27438) b!47135))

(assert (= (and b!47135 res!27439) b!47138))

(assert (= (and b!47136 condMapEmpty!2060) mapIsEmpty!2060))

(assert (= (and b!47136 (not condMapEmpty!2060)) mapNonEmpty!2060))

(get-info :version)

(assert (= (and mapNonEmpty!2060 ((_ is ValueCellFull!719) mapValue!2060)) b!47137))

(assert (= (and b!47136 ((_ is ValueCellFull!719) mapDefault!2060)) b!47140))

(assert (= start!7356 b!47136))

(declare-fun m!41379 () Bool)

(assert (=> b!47135 m!41379))

(declare-fun m!41381 () Bool)

(assert (=> mapNonEmpty!2060 m!41381))

(declare-fun m!41383 () Bool)

(assert (=> start!7356 m!41383))

(declare-fun m!41385 () Bool)

(assert (=> start!7356 m!41385))

(declare-fun m!41387 () Bool)

(assert (=> start!7356 m!41387))

(check-sat (not start!7356) (not b!47135) (not mapNonEmpty!2060) tp_is_empty!2017)
(check-sat)
(get-model)

(declare-fun d!9413 () Bool)

(assert (=> d!9413 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7356 d!9413))

(declare-fun d!9415 () Bool)

(assert (=> d!9415 (= (array_inv!878 _values!1550) (bvsge (size!1702 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7356 d!9415))

(declare-fun d!9417 () Bool)

(assert (=> d!9417 (= (array_inv!879 _keys!1940) (bvsge (size!1701 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7356 d!9417))

(declare-fun d!9419 () Bool)

(declare-fun res!27464 () Bool)

(declare-fun e!30195 () Bool)

(assert (=> d!9419 (=> res!27464 e!30195)))

(assert (=> d!9419 (= res!27464 (bvsge #b00000000000000000000000000000000 (size!1701 _keys!1940)))))

(assert (=> d!9419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30195)))

(declare-fun b!47185 () Bool)

(declare-fun e!30196 () Bool)

(declare-fun call!3701 () Bool)

(assert (=> b!47185 (= e!30196 call!3701)))

(declare-fun b!47186 () Bool)

(declare-fun e!30194 () Bool)

(assert (=> b!47186 (= e!30195 e!30194)))

(declare-fun c!6386 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47186 (= c!6386 (validKeyInArray!0 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47187 () Bool)

(assert (=> b!47187 (= e!30194 call!3701)))

(declare-fun b!47188 () Bool)

(assert (=> b!47188 (= e!30194 e!30196)))

(declare-fun lt!20355 () (_ BitVec 64))

(assert (=> b!47188 (= lt!20355 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1340 0))(
  ( (Unit!1341) )
))
(declare-fun lt!20354 () Unit!1340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3084 (_ BitVec 64) (_ BitVec 32)) Unit!1340)

(assert (=> b!47188 (= lt!20354 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20355 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47188 (arrayContainsKey!0 _keys!1940 lt!20355 #b00000000000000000000000000000000)))

(declare-fun lt!20353 () Unit!1340)

(assert (=> b!47188 (= lt!20353 lt!20354)))

(declare-fun res!27463 () Bool)

(declare-datatypes ((SeekEntryResult!200 0))(
  ( (MissingZero!200 (index!2922 (_ BitVec 32))) (Found!200 (index!2923 (_ BitVec 32))) (Intermediate!200 (undefined!1012 Bool) (index!2924 (_ BitVec 32)) (x!8720 (_ BitVec 32))) (Undefined!200) (MissingVacant!200 (index!2925 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3084 (_ BitVec 32)) SeekEntryResult!200)

(assert (=> b!47188 (= res!27463 (= (seekEntryOrOpen!0 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!200 #b00000000000000000000000000000000)))))

(assert (=> b!47188 (=> (not res!27463) (not e!30196))))

(declare-fun bm!3698 () Bool)

(assert (=> bm!3698 (= call!3701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9419 (not res!27464)) b!47186))

(assert (= (and b!47186 c!6386) b!47188))

(assert (= (and b!47186 (not c!6386)) b!47187))

(assert (= (and b!47188 res!27463) b!47185))

(assert (= (or b!47185 b!47187) bm!3698))

(declare-fun m!41409 () Bool)

(assert (=> b!47186 m!41409))

(assert (=> b!47186 m!41409))

(declare-fun m!41411 () Bool)

(assert (=> b!47186 m!41411))

(assert (=> b!47188 m!41409))

(declare-fun m!41413 () Bool)

(assert (=> b!47188 m!41413))

(declare-fun m!41415 () Bool)

(assert (=> b!47188 m!41415))

(assert (=> b!47188 m!41409))

(declare-fun m!41417 () Bool)

(assert (=> b!47188 m!41417))

(declare-fun m!41419 () Bool)

(assert (=> bm!3698 m!41419))

(assert (=> b!47135 d!9419))

(declare-fun mapIsEmpty!2069 () Bool)

(declare-fun mapRes!2069 () Bool)

(assert (=> mapIsEmpty!2069 mapRes!2069))

(declare-fun condMapEmpty!2069 () Bool)

(declare-fun mapDefault!2069 () ValueCell!719)

(assert (=> mapNonEmpty!2060 (= condMapEmpty!2069 (= mapRest!2060 ((as const (Array (_ BitVec 32) ValueCell!719)) mapDefault!2069)))))

(declare-fun e!30202 () Bool)

(assert (=> mapNonEmpty!2060 (= tp!6209 (and e!30202 mapRes!2069))))

(declare-fun b!47196 () Bool)

(assert (=> b!47196 (= e!30202 tp_is_empty!2017)))

(declare-fun b!47195 () Bool)

(declare-fun e!30201 () Bool)

(assert (=> b!47195 (= e!30201 tp_is_empty!2017)))

(declare-fun mapNonEmpty!2069 () Bool)

(declare-fun tp!6218 () Bool)

(assert (=> mapNonEmpty!2069 (= mapRes!2069 (and tp!6218 e!30201))))

(declare-fun mapKey!2069 () (_ BitVec 32))

(declare-fun mapRest!2069 () (Array (_ BitVec 32) ValueCell!719))

(declare-fun mapValue!2069 () ValueCell!719)

(assert (=> mapNonEmpty!2069 (= mapRest!2060 (store mapRest!2069 mapKey!2069 mapValue!2069))))

(assert (= (and mapNonEmpty!2060 condMapEmpty!2069) mapIsEmpty!2069))

(assert (= (and mapNonEmpty!2060 (not condMapEmpty!2069)) mapNonEmpty!2069))

(assert (= (and mapNonEmpty!2069 ((_ is ValueCellFull!719) mapValue!2069)) b!47195))

(assert (= (and mapNonEmpty!2060 ((_ is ValueCellFull!719) mapDefault!2069)) b!47196))

(declare-fun m!41421 () Bool)

(assert (=> mapNonEmpty!2069 m!41421))

(check-sat (not mapNonEmpty!2069) (not b!47188) tp_is_empty!2017 (not bm!3698) (not b!47186))
(check-sat)
