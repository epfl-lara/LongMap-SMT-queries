; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133952 () Bool)

(assert start!133952)

(declare-fun b_free!32175 () Bool)

(declare-fun b_next!32175 () Bool)

(assert (=> start!133952 (= b_free!32175 (not b_next!32175))))

(declare-fun tp!113827 () Bool)

(declare-fun b_and!51791 () Bool)

(assert (=> start!133952 (= tp!113827 b_and!51791)))

(declare-fun b!1565917 () Bool)

(declare-fun e!872820 () Bool)

(declare-fun e!872817 () Bool)

(assert (=> b!1565917 (= e!872820 (not e!872817))))

(declare-fun res!1070410 () Bool)

(assert (=> b!1565917 (=> res!1070410 e!872817)))

(declare-datatypes ((V!60139 0))(
  ( (V!60140 (val!19558 Int)) )
))
(declare-datatypes ((tuple2!25234 0))(
  ( (tuple2!25235 (_1!12628 (_ BitVec 64)) (_2!12628 V!60139)) )
))
(declare-datatypes ((List!36622 0))(
  ( (Nil!36619) (Cons!36618 (h!38064 tuple2!25234) (t!51511 List!36622)) )
))
(declare-datatypes ((ListLongMap!22669 0))(
  ( (ListLongMap!22670 (toList!11350 List!36622)) )
))
(declare-fun lt!672470 () ListLongMap!22669)

(declare-fun contains!10341 (ListLongMap!22669 (_ BitVec 64)) Bool)

(assert (=> b!1565917 (= res!1070410 (contains!10341 lt!672470 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565917 (not (contains!10341 lt!672470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672472 () ListLongMap!22669)

(declare-datatypes ((array!104586 0))(
  ( (array!104587 (arr!50480 (Array (_ BitVec 32) (_ BitVec 64))) (size!51030 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104586)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672471 () V!60139)

(declare-fun +!5080 (ListLongMap!22669 tuple2!25234) ListLongMap!22669)

(assert (=> b!1565917 (= lt!672470 (+!5080 lt!672472 (tuple2!25235 (select (arr!50480 _keys!637) from!782) lt!672471)))))

(declare-datatypes ((Unit!52024 0))(
  ( (Unit!52025) )
))
(declare-fun lt!672473 () Unit!52024)

(declare-fun addStillNotContains!570 (ListLongMap!22669 (_ BitVec 64) V!60139 (_ BitVec 64)) Unit!52024)

(assert (=> b!1565917 (= lt!672473 (addStillNotContains!570 lt!672472 (select (arr!50480 _keys!637) from!782) lt!672471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18444 0))(
  ( (ValueCellFull!18444 (v!22314 V!60139)) (EmptyCell!18444) )
))
(declare-datatypes ((array!104588 0))(
  ( (array!104589 (arr!50481 (Array (_ BitVec 32) ValueCell!18444)) (size!51031 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104588)

(declare-fun get!26353 (ValueCell!18444 V!60139) V!60139)

(declare-fun dynLambda!3864 (Int (_ BitVec 64)) V!60139)

(assert (=> b!1565917 (= lt!672471 (get!26353 (select (arr!50481 _values!487) from!782) (dynLambda!3864 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60139)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60139)

(declare-fun getCurrentListMapNoExtraKeys!6715 (array!104586 array!104588 (_ BitVec 32) (_ BitVec 32) V!60139 V!60139 (_ BitVec 32) Int) ListLongMap!22669)

(assert (=> b!1565917 (= lt!672472 (getCurrentListMapNoExtraKeys!6715 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565918 () Bool)

(assert (=> b!1565918 (= e!872817 (bvslt from!782 (size!51031 _values!487)))))

(declare-fun mapIsEmpty!59815 () Bool)

(declare-fun mapRes!59815 () Bool)

(assert (=> mapIsEmpty!59815 mapRes!59815))

(declare-fun b!1565919 () Bool)

(declare-fun res!1070407 () Bool)

(assert (=> b!1565919 (=> (not res!1070407) (not e!872820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104586 (_ BitVec 32)) Bool)

(assert (=> b!1565919 (= res!1070407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565920 () Bool)

(declare-fun res!1070408 () Bool)

(assert (=> b!1565920 (=> (not res!1070408) (not e!872820))))

(declare-datatypes ((List!36623 0))(
  ( (Nil!36620) (Cons!36619 (h!38065 (_ BitVec 64)) (t!51512 List!36623)) )
))
(declare-fun arrayNoDuplicates!0 (array!104586 (_ BitVec 32) List!36623) Bool)

(assert (=> b!1565920 (= res!1070408 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36620))))

(declare-fun res!1070409 () Bool)

(assert (=> start!133952 (=> (not res!1070409) (not e!872820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133952 (= res!1070409 (validMask!0 mask!947))))

(assert (=> start!133952 e!872820))

(assert (=> start!133952 tp!113827))

(declare-fun tp_is_empty!38949 () Bool)

(assert (=> start!133952 tp_is_empty!38949))

(assert (=> start!133952 true))

(declare-fun array_inv!39225 (array!104586) Bool)

(assert (=> start!133952 (array_inv!39225 _keys!637)))

(declare-fun e!872819 () Bool)

(declare-fun array_inv!39226 (array!104588) Bool)

(assert (=> start!133952 (and (array_inv!39226 _values!487) e!872819)))

(declare-fun b!1565921 () Bool)

(declare-fun res!1070403 () Bool)

(assert (=> b!1565921 (=> (not res!1070403) (not e!872820))))

(assert (=> b!1565921 (= res!1070403 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51030 _keys!637)) (bvslt from!782 (size!51030 _keys!637))))))

(declare-fun b!1565922 () Bool)

(declare-fun res!1070404 () Bool)

(assert (=> b!1565922 (=> res!1070404 e!872817)))

(assert (=> b!1565922 (= res!1070404 (not (contains!10341 lt!672470 (select (arr!50480 _keys!637) from!782))))))

(declare-fun b!1565923 () Bool)

(declare-fun res!1070405 () Bool)

(assert (=> b!1565923 (=> (not res!1070405) (not e!872820))))

(assert (=> b!1565923 (= res!1070405 (and (= (size!51031 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51030 _keys!637) (size!51031 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59815 () Bool)

(declare-fun tp!113826 () Bool)

(declare-fun e!872821 () Bool)

(assert (=> mapNonEmpty!59815 (= mapRes!59815 (and tp!113826 e!872821))))

(declare-fun mapRest!59815 () (Array (_ BitVec 32) ValueCell!18444))

(declare-fun mapValue!59815 () ValueCell!18444)

(declare-fun mapKey!59815 () (_ BitVec 32))

(assert (=> mapNonEmpty!59815 (= (arr!50481 _values!487) (store mapRest!59815 mapKey!59815 mapValue!59815))))

(declare-fun b!1565924 () Bool)

(assert (=> b!1565924 (= e!872821 tp_is_empty!38949)))

(declare-fun b!1565925 () Bool)

(declare-fun e!872818 () Bool)

(assert (=> b!1565925 (= e!872818 tp_is_empty!38949)))

(declare-fun b!1565926 () Bool)

(assert (=> b!1565926 (= e!872819 (and e!872818 mapRes!59815))))

(declare-fun condMapEmpty!59815 () Bool)

(declare-fun mapDefault!59815 () ValueCell!18444)

(assert (=> b!1565926 (= condMapEmpty!59815 (= (arr!50481 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18444)) mapDefault!59815)))))

(declare-fun b!1565927 () Bool)

(declare-fun res!1070406 () Bool)

(assert (=> b!1565927 (=> (not res!1070406) (not e!872820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565927 (= res!1070406 (validKeyInArray!0 (select (arr!50480 _keys!637) from!782)))))

(assert (= (and start!133952 res!1070409) b!1565923))

(assert (= (and b!1565923 res!1070405) b!1565919))

(assert (= (and b!1565919 res!1070407) b!1565920))

(assert (= (and b!1565920 res!1070408) b!1565921))

(assert (= (and b!1565921 res!1070403) b!1565927))

(assert (= (and b!1565927 res!1070406) b!1565917))

(assert (= (and b!1565917 (not res!1070410)) b!1565922))

(assert (= (and b!1565922 (not res!1070404)) b!1565918))

(assert (= (and b!1565926 condMapEmpty!59815) mapIsEmpty!59815))

(assert (= (and b!1565926 (not condMapEmpty!59815)) mapNonEmpty!59815))

(get-info :version)

(assert (= (and mapNonEmpty!59815 ((_ is ValueCellFull!18444) mapValue!59815)) b!1565924))

(assert (= (and b!1565926 ((_ is ValueCellFull!18444) mapDefault!59815)) b!1565925))

(assert (= start!133952 b!1565926))

(declare-fun b_lambda!24989 () Bool)

(assert (=> (not b_lambda!24989) (not b!1565917)))

(declare-fun t!51510 () Bool)

(declare-fun tb!12643 () Bool)

(assert (=> (and start!133952 (= defaultEntry!495 defaultEntry!495) t!51510) tb!12643))

(declare-fun result!26577 () Bool)

(assert (=> tb!12643 (= result!26577 tp_is_empty!38949)))

(assert (=> b!1565917 t!51510))

(declare-fun b_and!51793 () Bool)

(assert (= b_and!51791 (and (=> t!51510 result!26577) b_and!51793)))

(declare-fun m!1440843 () Bool)

(assert (=> b!1565919 m!1440843))

(declare-fun m!1440845 () Bool)

(assert (=> b!1565917 m!1440845))

(declare-fun m!1440847 () Bool)

(assert (=> b!1565917 m!1440847))

(declare-fun m!1440849 () Bool)

(assert (=> b!1565917 m!1440849))

(declare-fun m!1440851 () Bool)

(assert (=> b!1565917 m!1440851))

(declare-fun m!1440853 () Bool)

(assert (=> b!1565917 m!1440853))

(assert (=> b!1565917 m!1440845))

(declare-fun m!1440855 () Bool)

(assert (=> b!1565917 m!1440855))

(declare-fun m!1440857 () Bool)

(assert (=> b!1565917 m!1440857))

(assert (=> b!1565917 m!1440847))

(declare-fun m!1440859 () Bool)

(assert (=> b!1565917 m!1440859))

(assert (=> b!1565917 m!1440857))

(declare-fun m!1440861 () Bool)

(assert (=> b!1565917 m!1440861))

(assert (=> b!1565922 m!1440857))

(assert (=> b!1565922 m!1440857))

(declare-fun m!1440863 () Bool)

(assert (=> b!1565922 m!1440863))

(declare-fun m!1440865 () Bool)

(assert (=> start!133952 m!1440865))

(declare-fun m!1440867 () Bool)

(assert (=> start!133952 m!1440867))

(declare-fun m!1440869 () Bool)

(assert (=> start!133952 m!1440869))

(assert (=> b!1565927 m!1440857))

(assert (=> b!1565927 m!1440857))

(declare-fun m!1440871 () Bool)

(assert (=> b!1565927 m!1440871))

(declare-fun m!1440873 () Bool)

(assert (=> b!1565920 m!1440873))

(declare-fun m!1440875 () Bool)

(assert (=> mapNonEmpty!59815 m!1440875))

(check-sat b_and!51793 (not b_lambda!24989) tp_is_empty!38949 (not b!1565920) (not mapNonEmpty!59815) (not b!1565927) (not b!1565919) (not b_next!32175) (not start!133952) (not b!1565917) (not b!1565922))
(check-sat b_and!51793 (not b_next!32175))
