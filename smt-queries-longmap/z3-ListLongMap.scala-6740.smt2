; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84430 () Bool)

(assert start!84430)

(declare-fun b_free!19999 () Bool)

(declare-fun b_next!19999 () Bool)

(assert (=> start!84430 (= b_free!19999 (not b_next!19999))))

(declare-fun tp!69778 () Bool)

(declare-fun b_and!32039 () Bool)

(assert (=> start!84430 (= tp!69778 b_and!32039)))

(declare-fun b!987461 () Bool)

(declare-fun e!556797 () Bool)

(declare-fun e!556800 () Bool)

(assert (=> b!987461 (= e!556797 (not e!556800))))

(declare-fun res!660642 () Bool)

(assert (=> b!987461 (=> res!660642 e!556800)))

(declare-datatypes ((array!62322 0))(
  ( (array!62323 (arr!30017 (Array (_ BitVec 32) (_ BitVec 64))) (size!30498 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62322)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987461 (= res!660642 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30017 _keys!1544) from!1932)))))

(declare-datatypes ((V!35937 0))(
  ( (V!35938 (val!11658 Int)) )
))
(declare-datatypes ((tuple2!14928 0))(
  ( (tuple2!14929 (_1!7475 (_ BitVec 64)) (_2!7475 V!35937)) )
))
(declare-datatypes ((List!20817 0))(
  ( (Nil!20814) (Cons!20813 (h!21975 tuple2!14928) (t!29735 List!20817)) )
))
(declare-datatypes ((ListLongMap!13615 0))(
  ( (ListLongMap!13616 (toList!6823 List!20817)) )
))
(declare-fun lt!437710 () ListLongMap!13615)

(declare-fun lt!437703 () tuple2!14928)

(declare-fun lt!437709 () ListLongMap!13615)

(declare-fun lt!437707 () tuple2!14928)

(declare-fun +!3099 (ListLongMap!13615 tuple2!14928) ListLongMap!13615)

(assert (=> b!987461 (= (+!3099 lt!437709 lt!437703) (+!3099 lt!437710 lt!437707))))

(declare-fun lt!437705 () ListLongMap!13615)

(assert (=> b!987461 (= lt!437710 (+!3099 lt!437705 lt!437703))))

(declare-fun lt!437713 () V!35937)

(assert (=> b!987461 (= lt!437703 (tuple2!14929 (select (arr!30017 _keys!1544) from!1932) lt!437713))))

(assert (=> b!987461 (= lt!437709 (+!3099 lt!437705 lt!437707))))

(declare-fun minValue!1220 () V!35937)

(assert (=> b!987461 (= lt!437707 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32650 0))(
  ( (Unit!32651) )
))
(declare-fun lt!437704 () Unit!32650)

(declare-fun addCommutativeForDiffKeys!695 (ListLongMap!13615 (_ BitVec 64) V!35937 (_ BitVec 64) V!35937) Unit!32650)

(assert (=> b!987461 (= lt!437704 (addCommutativeForDiffKeys!695 lt!437705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30017 _keys!1544) from!1932) lt!437713))))

(declare-datatypes ((ValueCell!11126 0))(
  ( (ValueCellFull!11126 (v!14221 V!35937)) (EmptyCell!11126) )
))
(declare-datatypes ((array!62324 0))(
  ( (array!62325 (arr!30018 (Array (_ BitVec 32) ValueCell!11126)) (size!30499 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62324)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15588 (ValueCell!11126 V!35937) V!35937)

(declare-fun dynLambda!1848 (Int (_ BitVec 64)) V!35937)

(assert (=> b!987461 (= lt!437713 (get!15588 (select (arr!30018 _values!1278) from!1932) (dynLambda!1848 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!437711 () ListLongMap!13615)

(declare-fun lt!437706 () tuple2!14928)

(assert (=> b!987461 (= lt!437705 (+!3099 lt!437711 lt!437706))))

(declare-fun zeroValue!1220 () V!35937)

(assert (=> b!987461 (= lt!437706 (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3527 (array!62322 array!62324 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13615)

(assert (=> b!987461 (= lt!437711 (getCurrentListMapNoExtraKeys!3527 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!987462 () Bool)

(declare-fun res!660637 () Bool)

(assert (=> b!987462 (=> (not res!660637) (not e!556797))))

(assert (=> b!987462 (= res!660637 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30498 _keys!1544))))))

(declare-fun b!987463 () Bool)

(declare-fun e!556799 () Bool)

(declare-fun tp_is_empty!23215 () Bool)

(assert (=> b!987463 (= e!556799 tp_is_empty!23215)))

(declare-fun b!987464 () Bool)

(declare-fun e!556798 () Bool)

(assert (=> b!987464 (= e!556798 tp_is_empty!23215)))

(declare-fun b!987465 () Bool)

(declare-fun res!660644 () Bool)

(assert (=> b!987465 (=> (not res!660644) (not e!556797))))

(assert (=> b!987465 (= res!660644 (and (= (size!30499 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30498 _keys!1544) (size!30499 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987466 () Bool)

(declare-fun res!660638 () Bool)

(assert (=> b!987466 (=> (not res!660638) (not e!556797))))

(assert (=> b!987466 (= res!660638 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!660641 () Bool)

(assert (=> start!84430 (=> (not res!660641) (not e!556797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84430 (= res!660641 (validMask!0 mask!1948))))

(assert (=> start!84430 e!556797))

(assert (=> start!84430 true))

(assert (=> start!84430 tp_is_empty!23215))

(declare-fun e!556795 () Bool)

(declare-fun array_inv!23197 (array!62324) Bool)

(assert (=> start!84430 (and (array_inv!23197 _values!1278) e!556795)))

(assert (=> start!84430 tp!69778))

(declare-fun array_inv!23198 (array!62322) Bool)

(assert (=> start!84430 (array_inv!23198 _keys!1544)))

(declare-fun b!987467 () Bool)

(assert (=> b!987467 (= e!556800 (bvslt from!1932 (size!30499 _values!1278)))))

(declare-fun lt!437708 () ListLongMap!13615)

(declare-fun getCurrentListMap!3809 (array!62322 array!62324 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13615)

(assert (=> b!987467 (= lt!437708 (getCurrentListMap!3809 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (=> b!987467 (= lt!437710 (+!3099 (+!3099 lt!437711 lt!437703) lt!437706))))

(declare-fun lt!437712 () Unit!32650)

(assert (=> b!987467 (= lt!437712 (addCommutativeForDiffKeys!695 lt!437711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30017 _keys!1544) from!1932) lt!437713))))

(declare-fun b!987468 () Bool)

(declare-fun res!660639 () Bool)

(assert (=> b!987468 (=> (not res!660639) (not e!556797))))

(declare-datatypes ((List!20818 0))(
  ( (Nil!20815) (Cons!20814 (h!21976 (_ BitVec 64)) (t!29736 List!20818)) )
))
(declare-fun arrayNoDuplicates!0 (array!62322 (_ BitVec 32) List!20818) Bool)

(assert (=> b!987468 (= res!660639 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20815))))

(declare-fun b!987469 () Bool)

(declare-fun mapRes!36857 () Bool)

(assert (=> b!987469 (= e!556795 (and e!556799 mapRes!36857))))

(declare-fun condMapEmpty!36857 () Bool)

(declare-fun mapDefault!36857 () ValueCell!11126)

(assert (=> b!987469 (= condMapEmpty!36857 (= (arr!30018 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11126)) mapDefault!36857)))))

(declare-fun mapIsEmpty!36857 () Bool)

(assert (=> mapIsEmpty!36857 mapRes!36857))

(declare-fun b!987470 () Bool)

(declare-fun res!660643 () Bool)

(assert (=> b!987470 (=> (not res!660643) (not e!556797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987470 (= res!660643 (validKeyInArray!0 (select (arr!30017 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36857 () Bool)

(declare-fun tp!69779 () Bool)

(assert (=> mapNonEmpty!36857 (= mapRes!36857 (and tp!69779 e!556798))))

(declare-fun mapKey!36857 () (_ BitVec 32))

(declare-fun mapRest!36857 () (Array (_ BitVec 32) ValueCell!11126))

(declare-fun mapValue!36857 () ValueCell!11126)

(assert (=> mapNonEmpty!36857 (= (arr!30018 _values!1278) (store mapRest!36857 mapKey!36857 mapValue!36857))))

(declare-fun b!987471 () Bool)

(declare-fun res!660640 () Bool)

(assert (=> b!987471 (=> (not res!660640) (not e!556797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62322 (_ BitVec 32)) Bool)

(assert (=> b!987471 (= res!660640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84430 res!660641) b!987465))

(assert (= (and b!987465 res!660644) b!987471))

(assert (= (and b!987471 res!660640) b!987468))

(assert (= (and b!987468 res!660639) b!987462))

(assert (= (and b!987462 res!660637) b!987470))

(assert (= (and b!987470 res!660643) b!987466))

(assert (= (and b!987466 res!660638) b!987461))

(assert (= (and b!987461 (not res!660642)) b!987467))

(assert (= (and b!987469 condMapEmpty!36857) mapIsEmpty!36857))

(assert (= (and b!987469 (not condMapEmpty!36857)) mapNonEmpty!36857))

(get-info :version)

(assert (= (and mapNonEmpty!36857 ((_ is ValueCellFull!11126) mapValue!36857)) b!987464))

(assert (= (and b!987469 ((_ is ValueCellFull!11126) mapDefault!36857)) b!987463))

(assert (= start!84430 b!987469))

(declare-fun b_lambda!15013 () Bool)

(assert (=> (not b_lambda!15013) (not b!987461)))

(declare-fun t!29734 () Bool)

(declare-fun tb!6769 () Bool)

(assert (=> (and start!84430 (= defaultEntry!1281 defaultEntry!1281) t!29734) tb!6769))

(declare-fun result!13539 () Bool)

(assert (=> tb!6769 (= result!13539 tp_is_empty!23215)))

(assert (=> b!987461 t!29734))

(declare-fun b_and!32041 () Bool)

(assert (= b_and!32039 (and (=> t!29734 result!13539) b_and!32041)))

(declare-fun m!913601 () Bool)

(assert (=> b!987470 m!913601))

(assert (=> b!987470 m!913601))

(declare-fun m!913603 () Bool)

(assert (=> b!987470 m!913603))

(declare-fun m!913605 () Bool)

(assert (=> start!84430 m!913605))

(declare-fun m!913607 () Bool)

(assert (=> start!84430 m!913607))

(declare-fun m!913609 () Bool)

(assert (=> start!84430 m!913609))

(assert (=> b!987467 m!913601))

(declare-fun m!913611 () Bool)

(assert (=> b!987467 m!913611))

(declare-fun m!913613 () Bool)

(assert (=> b!987467 m!913613))

(assert (=> b!987467 m!913601))

(declare-fun m!913615 () Bool)

(assert (=> b!987467 m!913615))

(assert (=> b!987467 m!913613))

(declare-fun m!913617 () Bool)

(assert (=> b!987467 m!913617))

(declare-fun m!913619 () Bool)

(assert (=> mapNonEmpty!36857 m!913619))

(declare-fun m!913621 () Bool)

(assert (=> b!987461 m!913621))

(declare-fun m!913623 () Bool)

(assert (=> b!987461 m!913623))

(declare-fun m!913625 () Bool)

(assert (=> b!987461 m!913625))

(assert (=> b!987461 m!913601))

(declare-fun m!913627 () Bool)

(assert (=> b!987461 m!913627))

(declare-fun m!913629 () Bool)

(assert (=> b!987461 m!913629))

(assert (=> b!987461 m!913601))

(declare-fun m!913631 () Bool)

(assert (=> b!987461 m!913631))

(declare-fun m!913633 () Bool)

(assert (=> b!987461 m!913633))

(declare-fun m!913635 () Bool)

(assert (=> b!987461 m!913635))

(declare-fun m!913637 () Bool)

(assert (=> b!987461 m!913637))

(assert (=> b!987461 m!913623))

(assert (=> b!987461 m!913637))

(declare-fun m!913639 () Bool)

(assert (=> b!987461 m!913639))

(declare-fun m!913641 () Bool)

(assert (=> b!987468 m!913641))

(declare-fun m!913643 () Bool)

(assert (=> b!987471 m!913643))

(check-sat (not b!987471) (not b_lambda!15013) (not b_next!19999) (not mapNonEmpty!36857) (not b!987467) (not start!84430) b_and!32041 (not b!987470) (not b!987468) tp_is_empty!23215 (not b!987461))
(check-sat b_and!32041 (not b_next!19999))
