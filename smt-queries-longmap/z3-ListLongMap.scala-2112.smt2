; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35842 () Bool)

(assert start!35842)

(declare-fun b!360216 () Bool)

(declare-fun res!200292 () Bool)

(declare-fun e!220589 () Bool)

(assert (=> b!360216 (=> (not res!200292) (not e!220589))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20141 0))(
  ( (array!20142 (arr!9564 (Array (_ BitVec 32) (_ BitVec 64))) (size!9916 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20141)

(assert (=> b!360216 (= res!200292 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9916 _keys!1456))))))

(declare-fun b!360217 () Bool)

(declare-fun e!220590 () Bool)

(declare-fun tp_is_empty!8295 () Bool)

(assert (=> b!360217 (= e!220590 tp_is_empty!8295)))

(declare-fun res!200298 () Bool)

(assert (=> start!35842 (=> (not res!200298) (not e!220589))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35842 (= res!200298 (validMask!0 mask!1842))))

(assert (=> start!35842 e!220589))

(assert (=> start!35842 tp_is_empty!8295))

(assert (=> start!35842 true))

(declare-fun array_inv!7034 (array!20141) Bool)

(assert (=> start!35842 (array_inv!7034 _keys!1456)))

(declare-datatypes ((V!12037 0))(
  ( (V!12038 (val!4192 Int)) )
))
(declare-datatypes ((ValueCell!3804 0))(
  ( (ValueCellFull!3804 (v!6386 V!12037)) (EmptyCell!3804) )
))
(declare-datatypes ((array!20143 0))(
  ( (array!20144 (arr!9565 (Array (_ BitVec 32) ValueCell!3804)) (size!9917 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20143)

(declare-fun e!220588 () Bool)

(declare-fun array_inv!7035 (array!20143) Bool)

(assert (=> start!35842 (and (array_inv!7035 _values!1208) e!220588)))

(declare-fun mapNonEmpty!13950 () Bool)

(declare-fun mapRes!13950 () Bool)

(declare-fun tp!28017 () Bool)

(assert (=> mapNonEmpty!13950 (= mapRes!13950 (and tp!28017 e!220590))))

(declare-fun mapRest!13950 () (Array (_ BitVec 32) ValueCell!3804))

(declare-fun mapKey!13950 () (_ BitVec 32))

(declare-fun mapValue!13950 () ValueCell!3804)

(assert (=> mapNonEmpty!13950 (= (arr!9565 _values!1208) (store mapRest!13950 mapKey!13950 mapValue!13950))))

(declare-fun b!360218 () Bool)

(declare-fun res!200294 () Bool)

(assert (=> b!360218 (=> (not res!200294) (not e!220589))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!360218 (= res!200294 (and (= (size!9917 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9916 _keys!1456) (size!9917 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13950 () Bool)

(assert (=> mapIsEmpty!13950 mapRes!13950))

(declare-fun b!360219 () Bool)

(declare-fun e!220592 () Bool)

(assert (=> b!360219 (= e!220588 (and e!220592 mapRes!13950))))

(declare-fun condMapEmpty!13950 () Bool)

(declare-fun mapDefault!13950 () ValueCell!3804)

(assert (=> b!360219 (= condMapEmpty!13950 (= (arr!9565 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3804)) mapDefault!13950)))))

(declare-fun b!360220 () Bool)

(assert (=> b!360220 (= e!220589 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360220 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12037)

(declare-datatypes ((Unit!11076 0))(
  ( (Unit!11077) )
))
(declare-fun lt!166430 () Unit!11076)

(declare-fun zeroValue!1150 () V!12037)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!53 (array!20141 array!20143 (_ BitVec 32) (_ BitVec 32) V!12037 V!12037 (_ BitVec 64) (_ BitVec 32)) Unit!11076)

(assert (=> b!360220 (= lt!166430 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!53 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360221 () Bool)

(declare-fun res!200293 () Bool)

(assert (=> b!360221 (=> (not res!200293) (not e!220589))))

(assert (=> b!360221 (= res!200293 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360222 () Bool)

(declare-fun res!200297 () Bool)

(assert (=> b!360222 (=> (not res!200297) (not e!220589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360222 (= res!200297 (validKeyInArray!0 k0!1077))))

(declare-fun b!360223 () Bool)

(assert (=> b!360223 (= e!220592 tp_is_empty!8295)))

(declare-fun b!360224 () Bool)

(declare-fun res!200295 () Bool)

(assert (=> b!360224 (=> (not res!200295) (not e!220589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20141 (_ BitVec 32)) Bool)

(assert (=> b!360224 (= res!200295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360225 () Bool)

(declare-fun res!200296 () Bool)

(assert (=> b!360225 (=> (not res!200296) (not e!220589))))

(assert (=> b!360225 (= res!200296 (not (= (select (arr!9564 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360226 () Bool)

(declare-fun res!200299 () Bool)

(assert (=> b!360226 (=> (not res!200299) (not e!220589))))

(declare-datatypes ((List!5484 0))(
  ( (Nil!5481) (Cons!5480 (h!6336 (_ BitVec 64)) (t!10634 List!5484)) )
))
(declare-fun arrayNoDuplicates!0 (array!20141 (_ BitVec 32) List!5484) Bool)

(assert (=> b!360226 (= res!200299 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5481))))

(assert (= (and start!35842 res!200298) b!360218))

(assert (= (and b!360218 res!200294) b!360224))

(assert (= (and b!360224 res!200295) b!360226))

(assert (= (and b!360226 res!200299) b!360222))

(assert (= (and b!360222 res!200297) b!360216))

(assert (= (and b!360216 res!200292) b!360221))

(assert (= (and b!360221 res!200293) b!360225))

(assert (= (and b!360225 res!200296) b!360220))

(assert (= (and b!360219 condMapEmpty!13950) mapIsEmpty!13950))

(assert (= (and b!360219 (not condMapEmpty!13950)) mapNonEmpty!13950))

(get-info :version)

(assert (= (and mapNonEmpty!13950 ((_ is ValueCellFull!3804) mapValue!13950)) b!360217))

(assert (= (and b!360219 ((_ is ValueCellFull!3804) mapDefault!13950)) b!360223))

(assert (= start!35842 b!360219))

(declare-fun m!357455 () Bool)

(assert (=> b!360224 m!357455))

(declare-fun m!357457 () Bool)

(assert (=> b!360221 m!357457))

(declare-fun m!357459 () Bool)

(assert (=> b!360225 m!357459))

(declare-fun m!357461 () Bool)

(assert (=> mapNonEmpty!13950 m!357461))

(declare-fun m!357463 () Bool)

(assert (=> start!35842 m!357463))

(declare-fun m!357465 () Bool)

(assert (=> start!35842 m!357465))

(declare-fun m!357467 () Bool)

(assert (=> start!35842 m!357467))

(declare-fun m!357469 () Bool)

(assert (=> b!360222 m!357469))

(declare-fun m!357471 () Bool)

(assert (=> b!360226 m!357471))

(declare-fun m!357473 () Bool)

(assert (=> b!360220 m!357473))

(declare-fun m!357475 () Bool)

(assert (=> b!360220 m!357475))

(check-sat tp_is_empty!8295 (not b!360224) (not b!360221) (not b!360222) (not start!35842) (not b!360220) (not b!360226) (not mapNonEmpty!13950))
(check-sat)
