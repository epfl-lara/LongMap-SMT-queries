; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97490 () Bool)

(assert start!97490)

(declare-fun b!1112781 () Bool)

(declare-fun res!742657 () Bool)

(declare-fun e!634385 () Bool)

(assert (=> b!1112781 (=> (not res!742657) (not e!634385))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112781 (= res!742657 (validMask!0 mask!1564))))

(declare-fun b!1112782 () Bool)

(declare-fun e!634382 () Bool)

(declare-fun tp_is_empty!27727 () Bool)

(assert (=> b!1112782 (= e!634382 tp_is_empty!27727)))

(declare-fun b!1112783 () Bool)

(declare-fun e!634384 () Bool)

(assert (=> b!1112783 (= e!634384 tp_is_empty!27727)))

(declare-fun b!1112784 () Bool)

(declare-fun res!742656 () Bool)

(assert (=> b!1112784 (=> (not res!742656) (not e!634385))))

(declare-datatypes ((array!72262 0))(
  ( (array!72263 (arr!34784 (Array (_ BitVec 32) (_ BitVec 64))) (size!35322 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72262)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1112784 (= res!742656 (= (select (arr!34784 _keys!1208) i!673) k0!934))))

(declare-fun b!1112785 () Bool)

(declare-fun res!742660 () Bool)

(assert (=> b!1112785 (=> (not res!742660) (not e!634385))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42097 0))(
  ( (V!42098 (val!13920 Int)) )
))
(declare-datatypes ((ValueCell!13154 0))(
  ( (ValueCellFull!13154 (v!16552 V!42097)) (EmptyCell!13154) )
))
(declare-datatypes ((array!72264 0))(
  ( (array!72265 (arr!34785 (Array (_ BitVec 32) ValueCell!13154)) (size!35323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72264)

(assert (=> b!1112785 (= res!742660 (and (= (size!35323 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35322 _keys!1208) (size!35323 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112786 () Bool)

(declare-fun e!634381 () Bool)

(assert (=> b!1112786 (= e!634381 (not true))))

(declare-fun arrayContainsKey!0 (array!72262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112786 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36341 0))(
  ( (Unit!36342) )
))
(declare-fun lt!496391 () Unit!36341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72262 (_ BitVec 64) (_ BitVec 32)) Unit!36341)

(assert (=> b!1112786 (= lt!496391 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!742658 () Bool)

(assert (=> start!97490 (=> (not res!742658) (not e!634385))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97490 (= res!742658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35322 _keys!1208))))))

(assert (=> start!97490 e!634385))

(declare-fun array_inv!26818 (array!72262) Bool)

(assert (=> start!97490 (array_inv!26818 _keys!1208)))

(assert (=> start!97490 true))

(declare-fun e!634386 () Bool)

(declare-fun array_inv!26819 (array!72264) Bool)

(assert (=> start!97490 (and (array_inv!26819 _values!996) e!634386)))

(declare-fun b!1112787 () Bool)

(declare-fun res!742661 () Bool)

(assert (=> b!1112787 (=> (not res!742661) (not e!634385))))

(assert (=> b!1112787 (= res!742661 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35322 _keys!1208))))))

(declare-fun b!1112788 () Bool)

(declare-fun res!742663 () Bool)

(assert (=> b!1112788 (=> (not res!742663) (not e!634385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72262 (_ BitVec 32)) Bool)

(assert (=> b!1112788 (= res!742663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112789 () Bool)

(assert (=> b!1112789 (= e!634385 e!634381)))

(declare-fun res!742655 () Bool)

(assert (=> b!1112789 (=> (not res!742655) (not e!634381))))

(declare-fun lt!496392 () array!72262)

(assert (=> b!1112789 (= res!742655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496392 mask!1564))))

(assert (=> b!1112789 (= lt!496392 (array!72263 (store (arr!34784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35322 _keys!1208)))))

(declare-fun b!1112790 () Bool)

(declare-fun res!742662 () Bool)

(assert (=> b!1112790 (=> (not res!742662) (not e!634385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112790 (= res!742662 (validKeyInArray!0 k0!934))))

(declare-fun b!1112791 () Bool)

(declare-fun res!742659 () Bool)

(assert (=> b!1112791 (=> (not res!742659) (not e!634385))))

(declare-datatypes ((List!24330 0))(
  ( (Nil!24327) (Cons!24326 (h!25535 (_ BitVec 64)) (t!34802 List!24330)) )
))
(declare-fun arrayNoDuplicates!0 (array!72262 (_ BitVec 32) List!24330) Bool)

(assert (=> b!1112791 (= res!742659 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun b!1112792 () Bool)

(declare-fun mapRes!43408 () Bool)

(assert (=> b!1112792 (= e!634386 (and e!634382 mapRes!43408))))

(declare-fun condMapEmpty!43408 () Bool)

(declare-fun mapDefault!43408 () ValueCell!13154)

(assert (=> b!1112792 (= condMapEmpty!43408 (= (arr!34785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13154)) mapDefault!43408)))))

(declare-fun mapIsEmpty!43408 () Bool)

(assert (=> mapIsEmpty!43408 mapRes!43408))

(declare-fun b!1112793 () Bool)

(declare-fun res!742654 () Bool)

(assert (=> b!1112793 (=> (not res!742654) (not e!634381))))

(assert (=> b!1112793 (= res!742654 (arrayNoDuplicates!0 lt!496392 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun mapNonEmpty!43408 () Bool)

(declare-fun tp!82652 () Bool)

(assert (=> mapNonEmpty!43408 (= mapRes!43408 (and tp!82652 e!634384))))

(declare-fun mapKey!43408 () (_ BitVec 32))

(declare-fun mapValue!43408 () ValueCell!13154)

(declare-fun mapRest!43408 () (Array (_ BitVec 32) ValueCell!13154))

(assert (=> mapNonEmpty!43408 (= (arr!34785 _values!996) (store mapRest!43408 mapKey!43408 mapValue!43408))))

(assert (= (and start!97490 res!742658) b!1112781))

(assert (= (and b!1112781 res!742657) b!1112785))

(assert (= (and b!1112785 res!742660) b!1112788))

(assert (= (and b!1112788 res!742663) b!1112791))

(assert (= (and b!1112791 res!742659) b!1112787))

(assert (= (and b!1112787 res!742661) b!1112790))

(assert (= (and b!1112790 res!742662) b!1112784))

(assert (= (and b!1112784 res!742656) b!1112789))

(assert (= (and b!1112789 res!742655) b!1112793))

(assert (= (and b!1112793 res!742654) b!1112786))

(assert (= (and b!1112792 condMapEmpty!43408) mapIsEmpty!43408))

(assert (= (and b!1112792 (not condMapEmpty!43408)) mapNonEmpty!43408))

(get-info :version)

(assert (= (and mapNonEmpty!43408 ((_ is ValueCellFull!13154) mapValue!43408)) b!1112783))

(assert (= (and b!1112792 ((_ is ValueCellFull!13154) mapDefault!43408)) b!1112782))

(assert (= start!97490 b!1112792))

(declare-fun m!1029669 () Bool)

(assert (=> start!97490 m!1029669))

(declare-fun m!1029671 () Bool)

(assert (=> start!97490 m!1029671))

(declare-fun m!1029673 () Bool)

(assert (=> b!1112789 m!1029673))

(declare-fun m!1029675 () Bool)

(assert (=> b!1112789 m!1029675))

(declare-fun m!1029677 () Bool)

(assert (=> mapNonEmpty!43408 m!1029677))

(declare-fun m!1029679 () Bool)

(assert (=> b!1112793 m!1029679))

(declare-fun m!1029681 () Bool)

(assert (=> b!1112791 m!1029681))

(declare-fun m!1029683 () Bool)

(assert (=> b!1112786 m!1029683))

(declare-fun m!1029685 () Bool)

(assert (=> b!1112786 m!1029685))

(declare-fun m!1029687 () Bool)

(assert (=> b!1112781 m!1029687))

(declare-fun m!1029689 () Bool)

(assert (=> b!1112790 m!1029689))

(declare-fun m!1029691 () Bool)

(assert (=> b!1112788 m!1029691))

(declare-fun m!1029693 () Bool)

(assert (=> b!1112784 m!1029693))

(check-sat tp_is_empty!27727 (not b!1112790) (not b!1112786) (not b!1112793) (not b!1112791) (not b!1112781) (not b!1112788) (not b!1112789) (not start!97490) (not mapNonEmpty!43408))
(check-sat)
