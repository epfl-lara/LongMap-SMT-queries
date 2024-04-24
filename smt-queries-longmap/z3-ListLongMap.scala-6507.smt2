; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83050 () Bool)

(assert start!83050)

(declare-fun b_free!19009 () Bool)

(declare-fun b_next!19009 () Bool)

(assert (=> start!83050 (= b_free!19009 (not b_next!19009))))

(declare-fun tp!66156 () Bool)

(declare-fun b_and!30507 () Bool)

(assert (=> start!83050 (= tp!66156 b_and!30507)))

(declare-fun b!967891 () Bool)

(declare-fun e!545662 () Bool)

(assert (=> b!967891 (= e!545662 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34073 0))(
  ( (V!34074 (val!10959 Int)) )
))
(declare-datatypes ((ValueCell!10427 0))(
  ( (ValueCellFull!10427 (v!13514 V!34073)) (EmptyCell!10427) )
))
(declare-datatypes ((array!59732 0))(
  ( (array!59733 (arr!28730 (Array (_ BitVec 32) ValueCell!10427)) (size!29210 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59732)

(declare-datatypes ((array!59734 0))(
  ( (array!59735 (arr!28731 (Array (_ BitVec 32) (_ BitVec 64))) (size!29211 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59734)

(declare-fun minValue!1342 () V!34073)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34073)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14082 0))(
  ( (tuple2!14083 (_1!7052 (_ BitVec 64)) (_2!7052 V!34073)) )
))
(declare-datatypes ((List!19929 0))(
  ( (Nil!19926) (Cons!19925 (h!21093 tuple2!14082) (t!28284 List!19929)) )
))
(declare-datatypes ((ListLongMap!12781 0))(
  ( (ListLongMap!12782 (toList!6406 List!19929)) )
))
(declare-fun contains!5518 (ListLongMap!12781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3639 (array!59734 array!59732 (_ BitVec 32) (_ BitVec 32) V!34073 V!34073 (_ BitVec 32) Int) ListLongMap!12781)

(assert (=> b!967891 (contains!5518 (getCurrentListMap!3639 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28731 _keys!1686) i!803))))

(declare-datatypes ((Unit!32268 0))(
  ( (Unit!32269) )
))
(declare-fun lt!431741 () Unit!32268)

(declare-fun lemmaInListMapFromThenInFromMinusOne!45 (array!59734 array!59732 (_ BitVec 32) (_ BitVec 32) V!34073 V!34073 (_ BitVec 32) (_ BitVec 32) Int) Unit!32268)

(assert (=> b!967891 (= lt!431741 (lemmaInListMapFromThenInFromMinusOne!45 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967892 () Bool)

(declare-fun res!647631 () Bool)

(assert (=> b!967892 (=> (not res!647631) (not e!545662))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967892 (= res!647631 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967893 () Bool)

(declare-fun res!647630 () Bool)

(assert (=> b!967893 (=> (not res!647630) (not e!545662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967893 (= res!647630 (validKeyInArray!0 (select (arr!28731 _keys!1686) i!803)))))

(declare-fun b!967894 () Bool)

(declare-fun e!545661 () Bool)

(declare-fun tp_is_empty!21817 () Bool)

(assert (=> b!967894 (= e!545661 tp_is_empty!21817)))

(declare-fun b!967895 () Bool)

(declare-fun res!647629 () Bool)

(assert (=> b!967895 (=> (not res!647629) (not e!545662))))

(declare-datatypes ((List!19930 0))(
  ( (Nil!19927) (Cons!19926 (h!21094 (_ BitVec 64)) (t!28285 List!19930)) )
))
(declare-fun arrayNoDuplicates!0 (array!59734 (_ BitVec 32) List!19930) Bool)

(assert (=> b!967895 (= res!647629 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19927))))

(declare-fun mapNonEmpty!34720 () Bool)

(declare-fun mapRes!34720 () Bool)

(declare-fun tp!66157 () Bool)

(declare-fun e!545659 () Bool)

(assert (=> mapNonEmpty!34720 (= mapRes!34720 (and tp!66157 e!545659))))

(declare-fun mapValue!34720 () ValueCell!10427)

(declare-fun mapKey!34720 () (_ BitVec 32))

(declare-fun mapRest!34720 () (Array (_ BitVec 32) ValueCell!10427))

(assert (=> mapNonEmpty!34720 (= (arr!28730 _values!1400) (store mapRest!34720 mapKey!34720 mapValue!34720))))

(declare-fun b!967896 () Bool)

(declare-fun res!647632 () Bool)

(assert (=> b!967896 (=> (not res!647632) (not e!545662))))

(assert (=> b!967896 (= res!647632 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29211 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29211 _keys!1686))))))

(declare-fun b!967897 () Bool)

(declare-fun res!647627 () Bool)

(assert (=> b!967897 (=> (not res!647627) (not e!545662))))

(assert (=> b!967897 (= res!647627 (contains!5518 (getCurrentListMap!3639 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28731 _keys!1686) i!803)))))

(declare-fun b!967898 () Bool)

(declare-fun e!545663 () Bool)

(assert (=> b!967898 (= e!545663 (and e!545661 mapRes!34720))))

(declare-fun condMapEmpty!34720 () Bool)

(declare-fun mapDefault!34720 () ValueCell!10427)

(assert (=> b!967898 (= condMapEmpty!34720 (= (arr!28730 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10427)) mapDefault!34720)))))

(declare-fun mapIsEmpty!34720 () Bool)

(assert (=> mapIsEmpty!34720 mapRes!34720))

(declare-fun b!967890 () Bool)

(declare-fun res!647634 () Bool)

(assert (=> b!967890 (=> (not res!647634) (not e!545662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59734 (_ BitVec 32)) Bool)

(assert (=> b!967890 (= res!647634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!647633 () Bool)

(assert (=> start!83050 (=> (not res!647633) (not e!545662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83050 (= res!647633 (validMask!0 mask!2110))))

(assert (=> start!83050 e!545662))

(assert (=> start!83050 true))

(declare-fun array_inv!22301 (array!59732) Bool)

(assert (=> start!83050 (and (array_inv!22301 _values!1400) e!545663)))

(declare-fun array_inv!22302 (array!59734) Bool)

(assert (=> start!83050 (array_inv!22302 _keys!1686)))

(assert (=> start!83050 tp!66156))

(assert (=> start!83050 tp_is_empty!21817))

(declare-fun b!967899 () Bool)

(declare-fun res!647628 () Bool)

(assert (=> b!967899 (=> (not res!647628) (not e!545662))))

(assert (=> b!967899 (= res!647628 (and (= (size!29210 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29211 _keys!1686) (size!29210 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967900 () Bool)

(assert (=> b!967900 (= e!545659 tp_is_empty!21817)))

(assert (= (and start!83050 res!647633) b!967899))

(assert (= (and b!967899 res!647628) b!967890))

(assert (= (and b!967890 res!647634) b!967895))

(assert (= (and b!967895 res!647629) b!967896))

(assert (= (and b!967896 res!647632) b!967893))

(assert (= (and b!967893 res!647630) b!967897))

(assert (= (and b!967897 res!647627) b!967892))

(assert (= (and b!967892 res!647631) b!967891))

(assert (= (and b!967898 condMapEmpty!34720) mapIsEmpty!34720))

(assert (= (and b!967898 (not condMapEmpty!34720)) mapNonEmpty!34720))

(get-info :version)

(assert (= (and mapNonEmpty!34720 ((_ is ValueCellFull!10427) mapValue!34720)) b!967900))

(assert (= (and b!967898 ((_ is ValueCellFull!10427) mapDefault!34720)) b!967894))

(assert (= start!83050 b!967898))

(declare-fun m!896929 () Bool)

(assert (=> b!967890 m!896929))

(declare-fun m!896931 () Bool)

(assert (=> b!967895 m!896931))

(declare-fun m!896933 () Bool)

(assert (=> b!967893 m!896933))

(assert (=> b!967893 m!896933))

(declare-fun m!896935 () Bool)

(assert (=> b!967893 m!896935))

(declare-fun m!896937 () Bool)

(assert (=> b!967891 m!896937))

(assert (=> b!967891 m!896933))

(assert (=> b!967891 m!896937))

(assert (=> b!967891 m!896933))

(declare-fun m!896939 () Bool)

(assert (=> b!967891 m!896939))

(declare-fun m!896941 () Bool)

(assert (=> b!967891 m!896941))

(declare-fun m!896943 () Bool)

(assert (=> mapNonEmpty!34720 m!896943))

(declare-fun m!896945 () Bool)

(assert (=> b!967897 m!896945))

(assert (=> b!967897 m!896933))

(assert (=> b!967897 m!896945))

(assert (=> b!967897 m!896933))

(declare-fun m!896947 () Bool)

(assert (=> b!967897 m!896947))

(declare-fun m!896949 () Bool)

(assert (=> start!83050 m!896949))

(declare-fun m!896951 () Bool)

(assert (=> start!83050 m!896951))

(declare-fun m!896953 () Bool)

(assert (=> start!83050 m!896953))

(check-sat (not b_next!19009) (not b!967891) (not b!967897) b_and!30507 (not b!967893) (not b!967895) tp_is_empty!21817 (not mapNonEmpty!34720) (not b!967890) (not start!83050))
(check-sat b_and!30507 (not b_next!19009))
