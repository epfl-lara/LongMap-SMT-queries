; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82620 () Bool)

(assert start!82620)

(declare-fun b_free!18753 () Bool)

(declare-fun b_next!18753 () Bool)

(assert (=> start!82620 (= b_free!18753 (not b_next!18753))))

(declare-fun tp!65379 () Bool)

(declare-fun b_and!30241 () Bool)

(assert (=> start!82620 (= tp!65379 b_and!30241)))

(declare-fun mapIsEmpty!34327 () Bool)

(declare-fun mapRes!34327 () Bool)

(assert (=> mapIsEmpty!34327 mapRes!34327))

(declare-fun b!962997 () Bool)

(declare-fun res!644477 () Bool)

(declare-fun e!543034 () Bool)

(assert (=> b!962997 (=> (not res!644477) (not e!543034))))

(declare-datatypes ((array!59205 0))(
  ( (array!59206 (arr!28471 (Array (_ BitVec 32) (_ BitVec 64))) (size!28950 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59205)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962997 (= res!644477 (validKeyInArray!0 (select (arr!28471 _keys!1686) i!803)))))

(declare-fun b!962998 () Bool)

(declare-fun e!543032 () Bool)

(declare-fun tp_is_empty!21555 () Bool)

(assert (=> b!962998 (= e!543032 tp_is_empty!21555)))

(declare-fun b!962999 () Bool)

(declare-fun res!644474 () Bool)

(assert (=> b!962999 (=> (not res!644474) (not e!543034))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33723 0))(
  ( (V!33724 (val!10828 Int)) )
))
(declare-datatypes ((ValueCell!10296 0))(
  ( (ValueCellFull!10296 (v!13386 V!33723)) (EmptyCell!10296) )
))
(declare-datatypes ((array!59207 0))(
  ( (array!59208 (arr!28472 (Array (_ BitVec 32) ValueCell!10296)) (size!28951 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59207)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962999 (= res!644474 (and (= (size!28951 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28950 _keys!1686) (size!28951 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963000 () Bool)

(declare-fun res!644476 () Bool)

(assert (=> b!963000 (=> (not res!644476) (not e!543034))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963000 (= res!644476 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963001 () Bool)

(declare-fun res!644479 () Bool)

(assert (=> b!963001 (=> (not res!644479) (not e!543034))))

(declare-datatypes ((List!19760 0))(
  ( (Nil!19757) (Cons!19756 (h!20918 (_ BitVec 64)) (t!28123 List!19760)) )
))
(declare-fun arrayNoDuplicates!0 (array!59205 (_ BitVec 32) List!19760) Bool)

(assert (=> b!963001 (= res!644479 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19757))))

(declare-fun b!963002 () Bool)

(declare-fun e!543035 () Bool)

(assert (=> b!963002 (= e!543035 (and e!543032 mapRes!34327))))

(declare-fun condMapEmpty!34327 () Bool)

(declare-fun mapDefault!34327 () ValueCell!10296)

(assert (=> b!963002 (= condMapEmpty!34327 (= (arr!28472 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10296)) mapDefault!34327)))))

(declare-fun b!963003 () Bool)

(declare-fun res!644473 () Bool)

(assert (=> b!963003 (=> (not res!644473) (not e!543034))))

(declare-fun minValue!1342 () V!33723)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33723)

(declare-datatypes ((tuple2!13910 0))(
  ( (tuple2!13911 (_1!6966 (_ BitVec 64)) (_2!6966 V!33723)) )
))
(declare-datatypes ((List!19761 0))(
  ( (Nil!19758) (Cons!19757 (h!20919 tuple2!13910) (t!28124 List!19761)) )
))
(declare-datatypes ((ListLongMap!12607 0))(
  ( (ListLongMap!12608 (toList!6319 List!19761)) )
))
(declare-fun contains!5422 (ListLongMap!12607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3552 (array!59205 array!59207 (_ BitVec 32) (_ BitVec 32) V!33723 V!33723 (_ BitVec 32) Int) ListLongMap!12607)

(assert (=> b!963003 (= res!644473 (contains!5422 (getCurrentListMap!3552 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28471 _keys!1686) i!803)))))

(declare-fun b!963004 () Bool)

(declare-fun e!543031 () Bool)

(assert (=> b!963004 (= e!543031 tp_is_empty!21555)))

(declare-fun b!963005 () Bool)

(declare-fun res!644478 () Bool)

(assert (=> b!963005 (=> (not res!644478) (not e!543034))))

(assert (=> b!963005 (= res!644478 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28950 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28950 _keys!1686))))))

(declare-fun b!963006 () Bool)

(assert (=> b!963006 (= e!543034 (not true))))

(assert (=> b!963006 (contains!5422 (getCurrentListMap!3552 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28471 _keys!1686) i!803))))

(declare-datatypes ((Unit!32223 0))(
  ( (Unit!32224) )
))
(declare-fun lt!430933 () Unit!32223)

(declare-fun lemmaInListMapFromThenInFromMinusOne!6 (array!59205 array!59207 (_ BitVec 32) (_ BitVec 32) V!33723 V!33723 (_ BitVec 32) (_ BitVec 32) Int) Unit!32223)

(assert (=> b!963006 (= lt!430933 (lemmaInListMapFromThenInFromMinusOne!6 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!644475 () Bool)

(assert (=> start!82620 (=> (not res!644475) (not e!543034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82620 (= res!644475 (validMask!0 mask!2110))))

(assert (=> start!82620 e!543034))

(assert (=> start!82620 true))

(declare-fun array_inv!22061 (array!59207) Bool)

(assert (=> start!82620 (and (array_inv!22061 _values!1400) e!543035)))

(declare-fun array_inv!22062 (array!59205) Bool)

(assert (=> start!82620 (array_inv!22062 _keys!1686)))

(assert (=> start!82620 tp!65379))

(assert (=> start!82620 tp_is_empty!21555))

(declare-fun b!963007 () Bool)

(declare-fun res!644472 () Bool)

(assert (=> b!963007 (=> (not res!644472) (not e!543034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59205 (_ BitVec 32)) Bool)

(assert (=> b!963007 (= res!644472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34327 () Bool)

(declare-fun tp!65378 () Bool)

(assert (=> mapNonEmpty!34327 (= mapRes!34327 (and tp!65378 e!543031))))

(declare-fun mapValue!34327 () ValueCell!10296)

(declare-fun mapKey!34327 () (_ BitVec 32))

(declare-fun mapRest!34327 () (Array (_ BitVec 32) ValueCell!10296))

(assert (=> mapNonEmpty!34327 (= (arr!28472 _values!1400) (store mapRest!34327 mapKey!34327 mapValue!34327))))

(assert (= (and start!82620 res!644475) b!962999))

(assert (= (and b!962999 res!644474) b!963007))

(assert (= (and b!963007 res!644472) b!963001))

(assert (= (and b!963001 res!644479) b!963005))

(assert (= (and b!963005 res!644478) b!962997))

(assert (= (and b!962997 res!644477) b!963003))

(assert (= (and b!963003 res!644473) b!963000))

(assert (= (and b!963000 res!644476) b!963006))

(assert (= (and b!963002 condMapEmpty!34327) mapIsEmpty!34327))

(assert (= (and b!963002 (not condMapEmpty!34327)) mapNonEmpty!34327))

(get-info :version)

(assert (= (and mapNonEmpty!34327 ((_ is ValueCellFull!10296) mapValue!34327)) b!963004))

(assert (= (and b!963002 ((_ is ValueCellFull!10296) mapDefault!34327)) b!962998))

(assert (= start!82620 b!963002))

(declare-fun m!892511 () Bool)

(assert (=> start!82620 m!892511))

(declare-fun m!892513 () Bool)

(assert (=> start!82620 m!892513))

(declare-fun m!892515 () Bool)

(assert (=> start!82620 m!892515))

(declare-fun m!892517 () Bool)

(assert (=> b!963007 m!892517))

(declare-fun m!892519 () Bool)

(assert (=> b!963001 m!892519))

(declare-fun m!892521 () Bool)

(assert (=> b!962997 m!892521))

(assert (=> b!962997 m!892521))

(declare-fun m!892523 () Bool)

(assert (=> b!962997 m!892523))

(declare-fun m!892525 () Bool)

(assert (=> b!963006 m!892525))

(assert (=> b!963006 m!892521))

(assert (=> b!963006 m!892525))

(assert (=> b!963006 m!892521))

(declare-fun m!892527 () Bool)

(assert (=> b!963006 m!892527))

(declare-fun m!892529 () Bool)

(assert (=> b!963006 m!892529))

(declare-fun m!892531 () Bool)

(assert (=> b!963003 m!892531))

(assert (=> b!963003 m!892521))

(assert (=> b!963003 m!892531))

(assert (=> b!963003 m!892521))

(declare-fun m!892533 () Bool)

(assert (=> b!963003 m!892533))

(declare-fun m!892535 () Bool)

(assert (=> mapNonEmpty!34327 m!892535))

(check-sat (not b!963007) tp_is_empty!21555 b_and!30241 (not b!963003) (not b!963001) (not start!82620) (not mapNonEmpty!34327) (not b!963006) (not b!962997) (not b_next!18753))
(check-sat b_and!30241 (not b_next!18753))
