; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35826 () Bool)

(assert start!35826)

(declare-fun b!359908 () Bool)

(declare-fun res!200140 () Bool)

(declare-fun e!220401 () Bool)

(assert (=> b!359908 (=> (not res!200140) (not e!220401))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20111 0))(
  ( (array!20112 (arr!9549 (Array (_ BitVec 32) (_ BitVec 64))) (size!9902 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20111)

(declare-datatypes ((V!12035 0))(
  ( (V!12036 (val!4191 Int)) )
))
(declare-datatypes ((ValueCell!3803 0))(
  ( (ValueCellFull!3803 (v!6379 V!12035)) (EmptyCell!3803) )
))
(declare-datatypes ((array!20113 0))(
  ( (array!20114 (arr!9550 (Array (_ BitVec 32) ValueCell!3803)) (size!9903 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20113)

(assert (=> b!359908 (= res!200140 (and (= (size!9903 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9902 _keys!1456) (size!9903 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359909 () Bool)

(declare-fun res!200146 () Bool)

(assert (=> b!359909 (=> (not res!200146) (not e!220401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20111 (_ BitVec 32)) Bool)

(assert (=> b!359909 (= res!200146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359910 () Bool)

(declare-fun res!200139 () Bool)

(assert (=> b!359910 (=> (not res!200139) (not e!220401))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359910 (= res!200139 (validKeyInArray!0 k0!1077))))

(declare-fun b!359911 () Bool)

(declare-fun res!200145 () Bool)

(assert (=> b!359911 (=> (not res!200145) (not e!220401))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!359911 (= res!200145 (not (= (select (arr!9549 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359912 () Bool)

(assert (=> b!359912 (= e!220401 (not true))))

(declare-fun arrayContainsKey!0 (array!20111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359912 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12035)

(declare-datatypes ((Unit!11056 0))(
  ( (Unit!11057) )
))
(declare-fun lt!166192 () Unit!11056)

(declare-fun zeroValue!1150 () V!12035)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!51 (array!20111 array!20113 (_ BitVec 32) (_ BitVec 32) V!12035 V!12035 (_ BitVec 64) (_ BitVec 32)) Unit!11056)

(assert (=> b!359912 (= lt!166192 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!51 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13947 () Bool)

(declare-fun mapRes!13947 () Bool)

(assert (=> mapIsEmpty!13947 mapRes!13947))

(declare-fun b!359913 () Bool)

(declare-fun e!220399 () Bool)

(declare-fun tp_is_empty!8293 () Bool)

(assert (=> b!359913 (= e!220399 tp_is_empty!8293)))

(declare-fun b!359914 () Bool)

(declare-fun e!220398 () Bool)

(assert (=> b!359914 (= e!220398 (and e!220399 mapRes!13947))))

(declare-fun condMapEmpty!13947 () Bool)

(declare-fun mapDefault!13947 () ValueCell!3803)

(assert (=> b!359914 (= condMapEmpty!13947 (= (arr!9550 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3803)) mapDefault!13947)))))

(declare-fun b!359915 () Bool)

(declare-fun res!200143 () Bool)

(assert (=> b!359915 (=> (not res!200143) (not e!220401))))

(assert (=> b!359915 (= res!200143 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359916 () Bool)

(declare-fun e!220400 () Bool)

(assert (=> b!359916 (= e!220400 tp_is_empty!8293)))

(declare-fun b!359917 () Bool)

(declare-fun res!200142 () Bool)

(assert (=> b!359917 (=> (not res!200142) (not e!220401))))

(declare-datatypes ((List!5452 0))(
  ( (Nil!5449) (Cons!5448 (h!6304 (_ BitVec 64)) (t!10593 List!5452)) )
))
(declare-fun arrayNoDuplicates!0 (array!20111 (_ BitVec 32) List!5452) Bool)

(assert (=> b!359917 (= res!200142 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5449))))

(declare-fun res!200144 () Bool)

(assert (=> start!35826 (=> (not res!200144) (not e!220401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35826 (= res!200144 (validMask!0 mask!1842))))

(assert (=> start!35826 e!220401))

(assert (=> start!35826 tp_is_empty!8293))

(assert (=> start!35826 true))

(declare-fun array_inv!7040 (array!20111) Bool)

(assert (=> start!35826 (array_inv!7040 _keys!1456)))

(declare-fun array_inv!7041 (array!20113) Bool)

(assert (=> start!35826 (and (array_inv!7041 _values!1208) e!220398)))

(declare-fun mapNonEmpty!13947 () Bool)

(declare-fun tp!28014 () Bool)

(assert (=> mapNonEmpty!13947 (= mapRes!13947 (and tp!28014 e!220400))))

(declare-fun mapRest!13947 () (Array (_ BitVec 32) ValueCell!3803))

(declare-fun mapKey!13947 () (_ BitVec 32))

(declare-fun mapValue!13947 () ValueCell!3803)

(assert (=> mapNonEmpty!13947 (= (arr!9550 _values!1208) (store mapRest!13947 mapKey!13947 mapValue!13947))))

(declare-fun b!359918 () Bool)

(declare-fun res!200141 () Bool)

(assert (=> b!359918 (=> (not res!200141) (not e!220401))))

(assert (=> b!359918 (= res!200141 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9902 _keys!1456))))))

(assert (= (and start!35826 res!200144) b!359908))

(assert (= (and b!359908 res!200140) b!359909))

(assert (= (and b!359909 res!200146) b!359917))

(assert (= (and b!359917 res!200142) b!359910))

(assert (= (and b!359910 res!200139) b!359918))

(assert (= (and b!359918 res!200141) b!359915))

(assert (= (and b!359915 res!200143) b!359911))

(assert (= (and b!359911 res!200145) b!359912))

(assert (= (and b!359914 condMapEmpty!13947) mapIsEmpty!13947))

(assert (= (and b!359914 (not condMapEmpty!13947)) mapNonEmpty!13947))

(get-info :version)

(assert (= (and mapNonEmpty!13947 ((_ is ValueCellFull!3803) mapValue!13947)) b!359916))

(assert (= (and b!359914 ((_ is ValueCellFull!3803) mapDefault!13947)) b!359913))

(assert (= start!35826 b!359914))

(declare-fun m!356703 () Bool)

(assert (=> mapNonEmpty!13947 m!356703))

(declare-fun m!356705 () Bool)

(assert (=> b!359917 m!356705))

(declare-fun m!356707 () Bool)

(assert (=> b!359915 m!356707))

(declare-fun m!356709 () Bool)

(assert (=> b!359911 m!356709))

(declare-fun m!356711 () Bool)

(assert (=> b!359912 m!356711))

(declare-fun m!356713 () Bool)

(assert (=> b!359912 m!356713))

(declare-fun m!356715 () Bool)

(assert (=> b!359910 m!356715))

(declare-fun m!356717 () Bool)

(assert (=> start!35826 m!356717))

(declare-fun m!356719 () Bool)

(assert (=> start!35826 m!356719))

(declare-fun m!356721 () Bool)

(assert (=> start!35826 m!356721))

(declare-fun m!356723 () Bool)

(assert (=> b!359909 m!356723))

(check-sat (not mapNonEmpty!13947) (not b!359909) tp_is_empty!8293 (not start!35826) (not b!359912) (not b!359915) (not b!359917) (not b!359910))
(check-sat)
