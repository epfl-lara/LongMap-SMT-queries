; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84058 () Bool)

(assert start!84058)

(declare-fun b_free!19831 () Bool)

(declare-fun b_next!19831 () Bool)

(assert (=> start!84058 (= b_free!19831 (not b_next!19831))))

(declare-fun tp!69016 () Bool)

(declare-fun b_and!31719 () Bool)

(assert (=> start!84058 (= tp!69016 b_and!31719)))

(declare-fun b!982845 () Bool)

(declare-fun e!553979 () Bool)

(declare-fun tp_is_empty!22879 () Bool)

(assert (=> b!982845 (= e!553979 tp_is_empty!22879)))

(declare-fun b!982846 () Bool)

(declare-fun res!657779 () Bool)

(declare-fun e!553980 () Bool)

(assert (=> b!982846 (=> (not res!657779) (not e!553980))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982846 (= res!657779 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982847 () Bool)

(declare-fun res!657775 () Bool)

(assert (=> b!982847 (=> (not res!657775) (not e!553980))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35489 0))(
  ( (V!35490 (val!11490 Int)) )
))
(declare-datatypes ((ValueCell!10958 0))(
  ( (ValueCellFull!10958 (v!14051 V!35489)) (EmptyCell!10958) )
))
(declare-datatypes ((array!61682 0))(
  ( (array!61683 (arr!29699 (Array (_ BitVec 32) ValueCell!10958)) (size!30180 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61682)

(declare-datatypes ((array!61684 0))(
  ( (array!61685 (arr!29700 (Array (_ BitVec 32) (_ BitVec 64))) (size!30181 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61684)

(assert (=> b!982847 (= res!657775 (and (= (size!30180 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30181 _keys!1544) (size!30180 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36347 () Bool)

(declare-fun mapRes!36347 () Bool)

(assert (=> mapIsEmpty!36347 mapRes!36347))

(declare-fun b!982848 () Bool)

(declare-fun res!657778 () Bool)

(assert (=> b!982848 (=> (not res!657778) (not e!553980))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982848 (= res!657778 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30181 _keys!1544))))))

(declare-fun b!982849 () Bool)

(declare-fun res!657774 () Bool)

(assert (=> b!982849 (=> (not res!657774) (not e!553980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61684 (_ BitVec 32)) Bool)

(assert (=> b!982849 (= res!657774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982850 () Bool)

(declare-fun e!553977 () Bool)

(assert (=> b!982850 (= e!553977 tp_is_empty!22879)))

(declare-fun res!657776 () Bool)

(assert (=> start!84058 (=> (not res!657776) (not e!553980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84058 (= res!657776 (validMask!0 mask!1948))))

(assert (=> start!84058 e!553980))

(assert (=> start!84058 true))

(assert (=> start!84058 tp_is_empty!22879))

(declare-fun e!553981 () Bool)

(declare-fun array_inv!22977 (array!61682) Bool)

(assert (=> start!84058 (and (array_inv!22977 _values!1278) e!553981)))

(assert (=> start!84058 tp!69016))

(declare-fun array_inv!22978 (array!61684) Bool)

(assert (=> start!84058 (array_inv!22978 _keys!1544)))

(declare-fun b!982851 () Bool)

(declare-fun e!553978 () Bool)

(assert (=> b!982851 (= e!553978 (not true))))

(declare-datatypes ((tuple2!14798 0))(
  ( (tuple2!14799 (_1!7410 (_ BitVec 64)) (_2!7410 V!35489)) )
))
(declare-datatypes ((List!20636 0))(
  ( (Nil!20633) (Cons!20632 (h!21794 tuple2!14798) (t!29408 List!20636)) )
))
(declare-datatypes ((ListLongMap!13485 0))(
  ( (ListLongMap!13486 (toList!6758 List!20636)) )
))
(declare-fun lt!436175 () ListLongMap!13485)

(declare-fun lt!436179 () tuple2!14798)

(declare-fun lt!436177 () tuple2!14798)

(declare-fun +!3047 (ListLongMap!13485 tuple2!14798) ListLongMap!13485)

(assert (=> b!982851 (= (+!3047 (+!3047 lt!436175 lt!436179) lt!436177) (+!3047 (+!3047 lt!436175 lt!436177) lt!436179))))

(declare-fun lt!436178 () V!35489)

(assert (=> b!982851 (= lt!436177 (tuple2!14799 (select (arr!29700 _keys!1544) from!1932) lt!436178))))

(declare-fun zeroValue!1220 () V!35489)

(assert (=> b!982851 (= lt!436179 (tuple2!14799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32560 0))(
  ( (Unit!32561) )
))
(declare-fun lt!436176 () Unit!32560)

(declare-fun addCommutativeForDiffKeys!651 (ListLongMap!13485 (_ BitVec 64) V!35489 (_ BitVec 64) V!35489) Unit!32560)

(assert (=> b!982851 (= lt!436176 (addCommutativeForDiffKeys!651 lt!436175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29700 _keys!1544) from!1932) lt!436178))))

(declare-fun b!982852 () Bool)

(declare-fun res!657777 () Bool)

(assert (=> b!982852 (=> (not res!657777) (not e!553980))))

(declare-datatypes ((List!20637 0))(
  ( (Nil!20634) (Cons!20633 (h!21795 (_ BitVec 64)) (t!29409 List!20637)) )
))
(declare-fun arrayNoDuplicates!0 (array!61684 (_ BitVec 32) List!20637) Bool)

(assert (=> b!982852 (= res!657777 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20634))))

(declare-fun b!982853 () Bool)

(assert (=> b!982853 (= e!553981 (and e!553979 mapRes!36347))))

(declare-fun condMapEmpty!36347 () Bool)

(declare-fun mapDefault!36347 () ValueCell!10958)

(assert (=> b!982853 (= condMapEmpty!36347 (= (arr!29699 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10958)) mapDefault!36347)))))

(declare-fun mapNonEmpty!36347 () Bool)

(declare-fun tp!69017 () Bool)

(assert (=> mapNonEmpty!36347 (= mapRes!36347 (and tp!69017 e!553977))))

(declare-fun mapKey!36347 () (_ BitVec 32))

(declare-fun mapRest!36347 () (Array (_ BitVec 32) ValueCell!10958))

(declare-fun mapValue!36347 () ValueCell!10958)

(assert (=> mapNonEmpty!36347 (= (arr!29699 _values!1278) (store mapRest!36347 mapKey!36347 mapValue!36347))))

(declare-fun b!982854 () Bool)

(declare-fun res!657773 () Bool)

(assert (=> b!982854 (=> (not res!657773) (not e!553980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982854 (= res!657773 (validKeyInArray!0 (select (arr!29700 _keys!1544) from!1932)))))

(declare-fun b!982855 () Bool)

(assert (=> b!982855 (= e!553980 e!553978)))

(declare-fun res!657780 () Bool)

(assert (=> b!982855 (=> (not res!657780) (not e!553978))))

(assert (=> b!982855 (= res!657780 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29700 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15423 (ValueCell!10958 V!35489) V!35489)

(declare-fun dynLambda!1797 (Int (_ BitVec 64)) V!35489)

(assert (=> b!982855 (= lt!436178 (get!15423 (select (arr!29699 _values!1278) from!1932) (dynLambda!1797 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35489)

(declare-fun getCurrentListMapNoExtraKeys!3467 (array!61684 array!61682 (_ BitVec 32) (_ BitVec 32) V!35489 V!35489 (_ BitVec 32) Int) ListLongMap!13485)

(assert (=> b!982855 (= lt!436175 (getCurrentListMapNoExtraKeys!3467 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84058 res!657776) b!982847))

(assert (= (and b!982847 res!657775) b!982849))

(assert (= (and b!982849 res!657774) b!982852))

(assert (= (and b!982852 res!657777) b!982848))

(assert (= (and b!982848 res!657778) b!982854))

(assert (= (and b!982854 res!657773) b!982846))

(assert (= (and b!982846 res!657779) b!982855))

(assert (= (and b!982855 res!657780) b!982851))

(assert (= (and b!982853 condMapEmpty!36347) mapIsEmpty!36347))

(assert (= (and b!982853 (not condMapEmpty!36347)) mapNonEmpty!36347))

(get-info :version)

(assert (= (and mapNonEmpty!36347 ((_ is ValueCellFull!10958) mapValue!36347)) b!982850))

(assert (= (and b!982853 ((_ is ValueCellFull!10958) mapDefault!36347)) b!982845))

(assert (= start!84058 b!982853))

(declare-fun b_lambda!14851 () Bool)

(assert (=> (not b_lambda!14851) (not b!982855)))

(declare-fun t!29407 () Bool)

(declare-fun tb!6623 () Bool)

(assert (=> (and start!84058 (= defaultEntry!1281 defaultEntry!1281) t!29407) tb!6623))

(declare-fun result!13243 () Bool)

(assert (=> tb!6623 (= result!13243 tp_is_empty!22879)))

(assert (=> b!982855 t!29407))

(declare-fun b_and!31721 () Bool)

(assert (= b_and!31719 (and (=> t!29407 result!13243) b_and!31721)))

(declare-fun m!909647 () Bool)

(assert (=> b!982852 m!909647))

(declare-fun m!909649 () Bool)

(assert (=> mapNonEmpty!36347 m!909649))

(declare-fun m!909651 () Bool)

(assert (=> b!982855 m!909651))

(declare-fun m!909653 () Bool)

(assert (=> b!982855 m!909653))

(declare-fun m!909655 () Bool)

(assert (=> b!982855 m!909655))

(declare-fun m!909657 () Bool)

(assert (=> b!982855 m!909657))

(assert (=> b!982855 m!909653))

(assert (=> b!982855 m!909657))

(declare-fun m!909659 () Bool)

(assert (=> b!982855 m!909659))

(declare-fun m!909661 () Bool)

(assert (=> b!982851 m!909661))

(declare-fun m!909663 () Bool)

(assert (=> b!982851 m!909663))

(assert (=> b!982851 m!909651))

(declare-fun m!909665 () Bool)

(assert (=> b!982851 m!909665))

(declare-fun m!909667 () Bool)

(assert (=> b!982851 m!909667))

(assert (=> b!982851 m!909661))

(assert (=> b!982851 m!909651))

(declare-fun m!909669 () Bool)

(assert (=> b!982851 m!909669))

(assert (=> b!982851 m!909665))

(declare-fun m!909671 () Bool)

(assert (=> b!982849 m!909671))

(declare-fun m!909673 () Bool)

(assert (=> start!84058 m!909673))

(declare-fun m!909675 () Bool)

(assert (=> start!84058 m!909675))

(declare-fun m!909677 () Bool)

(assert (=> start!84058 m!909677))

(assert (=> b!982854 m!909651))

(assert (=> b!982854 m!909651))

(declare-fun m!909679 () Bool)

(assert (=> b!982854 m!909679))

(check-sat (not b!982852) (not b!982851) (not b!982855) b_and!31721 (not b_lambda!14851) tp_is_empty!22879 (not start!84058) (not b_next!19831) (not mapNonEmpty!36347) (not b!982854) (not b!982849))
(check-sat b_and!31721 (not b_next!19831))
