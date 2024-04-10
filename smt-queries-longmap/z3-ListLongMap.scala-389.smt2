; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7338 () Bool)

(assert start!7338)

(declare-fun res!27439 () Bool)

(declare-fun e!30145 () Bool)

(assert (=> start!7338 (=> (not res!27439) (not e!30145))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7338 (= res!27439 (validMask!0 mask!2458))))

(assert (=> start!7338 e!30145))

(assert (=> start!7338 true))

(declare-datatypes ((V!2417 0))(
  ( (V!2418 (val!1045 Int)) )
))
(declare-datatypes ((ValueCell!717 0))(
  ( (ValueCellFull!717 (v!2105 V!2417)) (EmptyCell!717) )
))
(declare-datatypes ((array!3085 0))(
  ( (array!3086 (arr!1481 (Array (_ BitVec 32) ValueCell!717)) (size!1703 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3085)

(declare-fun e!30147 () Bool)

(declare-fun array_inv!888 (array!3085) Bool)

(assert (=> start!7338 (and (array_inv!888 _values!1550) e!30147)))

(declare-datatypes ((array!3087 0))(
  ( (array!3088 (arr!1482 (Array (_ BitVec 32) (_ BitVec 64))) (size!1704 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3087)

(declare-fun array_inv!889 (array!3087) Bool)

(assert (=> start!7338 (array_inv!889 _keys!1940)))

(declare-fun b!47136 () Bool)

(declare-fun e!30149 () Bool)

(declare-fun mapRes!2051 () Bool)

(assert (=> b!47136 (= e!30147 (and e!30149 mapRes!2051))))

(declare-fun condMapEmpty!2051 () Bool)

(declare-fun mapDefault!2051 () ValueCell!717)

(assert (=> b!47136 (= condMapEmpty!2051 (= (arr!1481 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!717)) mapDefault!2051)))))

(declare-fun b!47137 () Bool)

(declare-fun e!30148 () Bool)

(declare-fun tp_is_empty!2013 () Bool)

(assert (=> b!47137 (= e!30148 tp_is_empty!2013)))

(declare-fun mapNonEmpty!2051 () Bool)

(declare-fun tp!6200 () Bool)

(assert (=> mapNonEmpty!2051 (= mapRes!2051 (and tp!6200 e!30148))))

(declare-fun mapValue!2051 () ValueCell!717)

(declare-fun mapKey!2051 () (_ BitVec 32))

(declare-fun mapRest!2051 () (Array (_ BitVec 32) ValueCell!717))

(assert (=> mapNonEmpty!2051 (= (arr!1481 _values!1550) (store mapRest!2051 mapKey!2051 mapValue!2051))))

(declare-fun b!47138 () Bool)

(assert (=> b!47138 (= e!30149 tp_is_empty!2013)))

(declare-fun b!47139 () Bool)

(declare-fun res!27441 () Bool)

(assert (=> b!47139 (=> (not res!27441) (not e!30145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3087 (_ BitVec 32)) Bool)

(assert (=> b!47139 (= res!27441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun mapIsEmpty!2051 () Bool)

(assert (=> mapIsEmpty!2051 mapRes!2051))

(declare-fun b!47140 () Bool)

(assert (=> b!47140 (= e!30145 (bvsgt #b00000000000000000000000000000000 (size!1704 _keys!1940)))))

(declare-fun b!47141 () Bool)

(declare-fun res!27440 () Bool)

(assert (=> b!47141 (=> (not res!27440) (not e!30145))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47141 (= res!27440 (and (= (size!1703 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1704 _keys!1940) (size!1703 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(assert (= (and start!7338 res!27439) b!47141))

(assert (= (and b!47141 res!27440) b!47139))

(assert (= (and b!47139 res!27441) b!47140))

(assert (= (and b!47136 condMapEmpty!2051) mapIsEmpty!2051))

(assert (= (and b!47136 (not condMapEmpty!2051)) mapNonEmpty!2051))

(get-info :version)

(assert (= (and mapNonEmpty!2051 ((_ is ValueCellFull!717) mapValue!2051)) b!47137))

(assert (= (and b!47136 ((_ is ValueCellFull!717) mapDefault!2051)) b!47138))

(assert (= start!7338 b!47136))

(declare-fun m!41469 () Bool)

(assert (=> start!7338 m!41469))

(declare-fun m!41471 () Bool)

(assert (=> start!7338 m!41471))

(declare-fun m!41473 () Bool)

(assert (=> start!7338 m!41473))

(declare-fun m!41475 () Bool)

(assert (=> mapNonEmpty!2051 m!41475))

(declare-fun m!41477 () Bool)

(assert (=> b!47139 m!41477))

(check-sat (not start!7338) (not b!47139) (not mapNonEmpty!2051) tp_is_empty!2013)
(check-sat)
(get-model)

(declare-fun d!9415 () Bool)

(assert (=> d!9415 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7338 d!9415))

(declare-fun d!9417 () Bool)

(assert (=> d!9417 (= (array_inv!888 _values!1550) (bvsge (size!1703 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7338 d!9417))

(declare-fun d!9419 () Bool)

(assert (=> d!9419 (= (array_inv!889 _keys!1940) (bvsge (size!1704 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7338 d!9419))

(declare-fun d!9421 () Bool)

(declare-fun res!27455 () Bool)

(declare-fun e!30173 () Bool)

(assert (=> d!9421 (=> res!27455 e!30173)))

(assert (=> d!9421 (= res!27455 (bvsge #b00000000000000000000000000000000 (size!1704 _keys!1940)))))

(assert (=> d!9421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30173)))

(declare-fun bm!3709 () Bool)

(declare-fun call!3712 () Bool)

(assert (=> bm!3709 (= call!3712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun b!47168 () Bool)

(declare-fun e!30172 () Bool)

(assert (=> b!47168 (= e!30172 call!3712)))

(declare-fun b!47169 () Bool)

(declare-fun e!30171 () Bool)

(assert (=> b!47169 (= e!30171 call!3712)))

(declare-fun b!47170 () Bool)

(assert (=> b!47170 (= e!30171 e!30172)))

(declare-fun lt!20387 () (_ BitVec 64))

(assert (=> b!47170 (= lt!20387 (select (arr!1482 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1327 0))(
  ( (Unit!1328) )
))
(declare-fun lt!20388 () Unit!1327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3087 (_ BitVec 64) (_ BitVec 32)) Unit!1327)

(assert (=> b!47170 (= lt!20388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20387 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47170 (arrayContainsKey!0 _keys!1940 lt!20387 #b00000000000000000000000000000000)))

(declare-fun lt!20389 () Unit!1327)

(assert (=> b!47170 (= lt!20389 lt!20388)))

(declare-fun res!27456 () Bool)

(declare-datatypes ((SeekEntryResult!205 0))(
  ( (MissingZero!205 (index!2942 (_ BitVec 32))) (Found!205 (index!2943 (_ BitVec 32))) (Intermediate!205 (undefined!1017 Bool) (index!2944 (_ BitVec 32)) (x!8715 (_ BitVec 32))) (Undefined!205) (MissingVacant!205 (index!2945 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3087 (_ BitVec 32)) SeekEntryResult!205)

(assert (=> b!47170 (= res!27456 (= (seekEntryOrOpen!0 (select (arr!1482 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!205 #b00000000000000000000000000000000)))))

(assert (=> b!47170 (=> (not res!27456) (not e!30172))))

(declare-fun b!47171 () Bool)

(assert (=> b!47171 (= e!30173 e!30171)))

(declare-fun c!6399 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47171 (= c!6399 (validKeyInArray!0 (select (arr!1482 _keys!1940) #b00000000000000000000000000000000)))))

(assert (= (and d!9421 (not res!27455)) b!47171))

(assert (= (and b!47171 c!6399) b!47170))

(assert (= (and b!47171 (not c!6399)) b!47169))

(assert (= (and b!47170 res!27456) b!47168))

(assert (= (or b!47168 b!47169) bm!3709))

(declare-fun m!41489 () Bool)

(assert (=> bm!3709 m!41489))

(declare-fun m!41491 () Bool)

(assert (=> b!47170 m!41491))

(declare-fun m!41493 () Bool)

(assert (=> b!47170 m!41493))

(declare-fun m!41495 () Bool)

(assert (=> b!47170 m!41495))

(assert (=> b!47170 m!41491))

(declare-fun m!41497 () Bool)

(assert (=> b!47170 m!41497))

(assert (=> b!47171 m!41491))

(assert (=> b!47171 m!41491))

(declare-fun m!41499 () Bool)

(assert (=> b!47171 m!41499))

(assert (=> b!47139 d!9421))

(declare-fun mapIsEmpty!2057 () Bool)

(declare-fun mapRes!2057 () Bool)

(assert (=> mapIsEmpty!2057 mapRes!2057))

(declare-fun mapNonEmpty!2057 () Bool)

(declare-fun tp!6206 () Bool)

(declare-fun e!30179 () Bool)

(assert (=> mapNonEmpty!2057 (= mapRes!2057 (and tp!6206 e!30179))))

(declare-fun mapRest!2057 () (Array (_ BitVec 32) ValueCell!717))

(declare-fun mapValue!2057 () ValueCell!717)

(declare-fun mapKey!2057 () (_ BitVec 32))

(assert (=> mapNonEmpty!2057 (= mapRest!2051 (store mapRest!2057 mapKey!2057 mapValue!2057))))

(declare-fun condMapEmpty!2057 () Bool)

(declare-fun mapDefault!2057 () ValueCell!717)

(assert (=> mapNonEmpty!2051 (= condMapEmpty!2057 (= mapRest!2051 ((as const (Array (_ BitVec 32) ValueCell!717)) mapDefault!2057)))))

(declare-fun e!30178 () Bool)

(assert (=> mapNonEmpty!2051 (= tp!6200 (and e!30178 mapRes!2057))))

(declare-fun b!47178 () Bool)

(assert (=> b!47178 (= e!30179 tp_is_empty!2013)))

(declare-fun b!47179 () Bool)

(assert (=> b!47179 (= e!30178 tp_is_empty!2013)))

(assert (= (and mapNonEmpty!2051 condMapEmpty!2057) mapIsEmpty!2057))

(assert (= (and mapNonEmpty!2051 (not condMapEmpty!2057)) mapNonEmpty!2057))

(assert (= (and mapNonEmpty!2057 ((_ is ValueCellFull!717) mapValue!2057)) b!47178))

(assert (= (and mapNonEmpty!2051 ((_ is ValueCellFull!717) mapDefault!2057)) b!47179))

(declare-fun m!41501 () Bool)

(assert (=> mapNonEmpty!2057 m!41501))

(check-sat (not b!47170) (not b!47171) (not bm!3709) tp_is_empty!2013 (not mapNonEmpty!2057))
(check-sat)
