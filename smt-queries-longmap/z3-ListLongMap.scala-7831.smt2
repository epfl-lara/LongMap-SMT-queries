; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97724 () Bool)

(assert start!97724)

(declare-fun b!1117344 () Bool)

(declare-fun e!636487 () Bool)

(declare-fun e!636492 () Bool)

(assert (=> b!1117344 (= e!636487 e!636492)))

(declare-fun res!746171 () Bool)

(assert (=> b!1117344 (=> (not res!746171) (not e!636492))))

(declare-datatypes ((array!72718 0))(
  ( (array!72719 (arr!35012 (Array (_ BitVec 32) (_ BitVec 64))) (size!35550 (_ BitVec 32))) )
))
(declare-fun lt!497094 () array!72718)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72718 (_ BitVec 32)) Bool)

(assert (=> b!1117344 (= res!746171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497094 mask!1564))))

(declare-fun _keys!1208 () array!72718)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117344 (= lt!497094 (array!72719 (store (arr!35012 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35550 _keys!1208)))))

(declare-fun res!746166 () Bool)

(assert (=> start!97724 (=> (not res!746166) (not e!636487))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97724 (= res!746166 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35550 _keys!1208))))))

(assert (=> start!97724 e!636487))

(declare-fun array_inv!26978 (array!72718) Bool)

(assert (=> start!97724 (array_inv!26978 _keys!1208)))

(assert (=> start!97724 true))

(declare-datatypes ((V!42409 0))(
  ( (V!42410 (val!14037 Int)) )
))
(declare-datatypes ((ValueCell!13271 0))(
  ( (ValueCellFull!13271 (v!16669 V!42409)) (EmptyCell!13271) )
))
(declare-datatypes ((array!72720 0))(
  ( (array!72721 (arr!35013 (Array (_ BitVec 32) ValueCell!13271)) (size!35551 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72720)

(declare-fun e!636488 () Bool)

(declare-fun array_inv!26979 (array!72720) Bool)

(assert (=> start!97724 (and (array_inv!26979 _values!996) e!636488)))

(declare-fun b!1117345 () Bool)

(declare-fun res!746170 () Bool)

(assert (=> b!1117345 (=> (not res!746170) (not e!636487))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117345 (= res!746170 (validKeyInArray!0 k0!934))))

(declare-fun b!1117346 () Bool)

(assert (=> b!1117346 (= e!636492 (not true))))

(declare-fun arrayContainsKey!0 (array!72718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117346 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36499 0))(
  ( (Unit!36500) )
))
(declare-fun lt!497093 () Unit!36499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72718 (_ BitVec 64) (_ BitVec 32)) Unit!36499)

(assert (=> b!1117346 (= lt!497093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43759 () Bool)

(declare-fun mapRes!43759 () Bool)

(declare-fun tp!83003 () Bool)

(declare-fun e!636490 () Bool)

(assert (=> mapNonEmpty!43759 (= mapRes!43759 (and tp!83003 e!636490))))

(declare-fun mapRest!43759 () (Array (_ BitVec 32) ValueCell!13271))

(declare-fun mapKey!43759 () (_ BitVec 32))

(declare-fun mapValue!43759 () ValueCell!13271)

(assert (=> mapNonEmpty!43759 (= (arr!35013 _values!996) (store mapRest!43759 mapKey!43759 mapValue!43759))))

(declare-fun b!1117347 () Bool)

(declare-fun res!746165 () Bool)

(assert (=> b!1117347 (=> (not res!746165) (not e!636487))))

(assert (=> b!1117347 (= res!746165 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35550 _keys!1208))))))

(declare-fun b!1117348 () Bool)

(declare-fun res!746164 () Bool)

(assert (=> b!1117348 (=> (not res!746164) (not e!636492))))

(declare-datatypes ((List!24426 0))(
  ( (Nil!24423) (Cons!24422 (h!25631 (_ BitVec 64)) (t!34898 List!24426)) )
))
(declare-fun arrayNoDuplicates!0 (array!72718 (_ BitVec 32) List!24426) Bool)

(assert (=> b!1117348 (= res!746164 (arrayNoDuplicates!0 lt!497094 #b00000000000000000000000000000000 Nil!24423))))

(declare-fun b!1117349 () Bool)

(declare-fun tp_is_empty!27961 () Bool)

(assert (=> b!1117349 (= e!636490 tp_is_empty!27961)))

(declare-fun b!1117350 () Bool)

(declare-fun res!746168 () Bool)

(assert (=> b!1117350 (=> (not res!746168) (not e!636487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117350 (= res!746168 (validMask!0 mask!1564))))

(declare-fun b!1117351 () Bool)

(declare-fun res!746172 () Bool)

(assert (=> b!1117351 (=> (not res!746172) (not e!636487))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117351 (= res!746172 (and (= (size!35551 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35550 _keys!1208) (size!35551 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117352 () Bool)

(declare-fun res!746169 () Bool)

(assert (=> b!1117352 (=> (not res!746169) (not e!636487))))

(assert (=> b!1117352 (= res!746169 (= (select (arr!35012 _keys!1208) i!673) k0!934))))

(declare-fun b!1117353 () Bool)

(declare-fun res!746173 () Bool)

(assert (=> b!1117353 (=> (not res!746173) (not e!636487))))

(assert (=> b!1117353 (= res!746173 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24423))))

(declare-fun b!1117354 () Bool)

(declare-fun e!636491 () Bool)

(assert (=> b!1117354 (= e!636488 (and e!636491 mapRes!43759))))

(declare-fun condMapEmpty!43759 () Bool)

(declare-fun mapDefault!43759 () ValueCell!13271)

(assert (=> b!1117354 (= condMapEmpty!43759 (= (arr!35013 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13271)) mapDefault!43759)))))

(declare-fun mapIsEmpty!43759 () Bool)

(assert (=> mapIsEmpty!43759 mapRes!43759))

(declare-fun b!1117355 () Bool)

(assert (=> b!1117355 (= e!636491 tp_is_empty!27961)))

(declare-fun b!1117356 () Bool)

(declare-fun res!746167 () Bool)

(assert (=> b!1117356 (=> (not res!746167) (not e!636487))))

(assert (=> b!1117356 (= res!746167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97724 res!746166) b!1117350))

(assert (= (and b!1117350 res!746168) b!1117351))

(assert (= (and b!1117351 res!746172) b!1117356))

(assert (= (and b!1117356 res!746167) b!1117353))

(assert (= (and b!1117353 res!746173) b!1117347))

(assert (= (and b!1117347 res!746165) b!1117345))

(assert (= (and b!1117345 res!746170) b!1117352))

(assert (= (and b!1117352 res!746169) b!1117344))

(assert (= (and b!1117344 res!746171) b!1117348))

(assert (= (and b!1117348 res!746164) b!1117346))

(assert (= (and b!1117354 condMapEmpty!43759) mapIsEmpty!43759))

(assert (= (and b!1117354 (not condMapEmpty!43759)) mapNonEmpty!43759))

(get-info :version)

(assert (= (and mapNonEmpty!43759 ((_ is ValueCellFull!13271) mapValue!43759)) b!1117349))

(assert (= (and b!1117354 ((_ is ValueCellFull!13271) mapDefault!43759)) b!1117355))

(assert (= start!97724 b!1117354))

(declare-fun m!1032711 () Bool)

(assert (=> b!1117353 m!1032711))

(declare-fun m!1032713 () Bool)

(assert (=> b!1117356 m!1032713))

(declare-fun m!1032715 () Bool)

(assert (=> b!1117352 m!1032715))

(declare-fun m!1032717 () Bool)

(assert (=> b!1117344 m!1032717))

(declare-fun m!1032719 () Bool)

(assert (=> b!1117344 m!1032719))

(declare-fun m!1032721 () Bool)

(assert (=> b!1117348 m!1032721))

(declare-fun m!1032723 () Bool)

(assert (=> b!1117346 m!1032723))

(declare-fun m!1032725 () Bool)

(assert (=> b!1117346 m!1032725))

(declare-fun m!1032727 () Bool)

(assert (=> start!97724 m!1032727))

(declare-fun m!1032729 () Bool)

(assert (=> start!97724 m!1032729))

(declare-fun m!1032731 () Bool)

(assert (=> b!1117345 m!1032731))

(declare-fun m!1032733 () Bool)

(assert (=> b!1117350 m!1032733))

(declare-fun m!1032735 () Bool)

(assert (=> mapNonEmpty!43759 m!1032735))

(check-sat (not b!1117344) (not b!1117348) (not b!1117345) (not b!1117350) (not start!97724) (not b!1117353) tp_is_empty!27961 (not b!1117346) (not b!1117356) (not mapNonEmpty!43759))
(check-sat)
