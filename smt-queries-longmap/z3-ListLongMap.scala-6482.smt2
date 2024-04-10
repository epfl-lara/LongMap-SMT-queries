; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82734 () Bool)

(assert start!82734)

(declare-fun b_free!18867 () Bool)

(declare-fun b_next!18867 () Bool)

(assert (=> start!82734 (= b_free!18867 (not b_next!18867))))

(declare-fun tp!65721 () Bool)

(declare-fun b_and!30355 () Bool)

(assert (=> start!82734 (= tp!65721 b_and!30355)))

(declare-fun b!964949 () Bool)

(declare-fun res!645914 () Bool)

(declare-fun e!543968 () Bool)

(assert (=> b!964949 (=> (not res!645914) (not e!543968))))

(declare-datatypes ((array!59423 0))(
  ( (array!59424 (arr!28580 (Array (_ BitVec 32) (_ BitVec 64))) (size!29059 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59423)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59423 (_ BitVec 32)) Bool)

(assert (=> b!964949 (= res!645914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964950 () Bool)

(assert (=> b!964950 (= e!543968 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431185 () Bool)

(declare-datatypes ((V!33875 0))(
  ( (V!33876 (val!10885 Int)) )
))
(declare-datatypes ((ValueCell!10353 0))(
  ( (ValueCellFull!10353 (v!13443 V!33875)) (EmptyCell!10353) )
))
(declare-datatypes ((array!59425 0))(
  ( (array!59426 (arr!28581 (Array (_ BitVec 32) ValueCell!10353)) (size!29060 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59425)

(declare-fun minValue!1342 () V!33875)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33875)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13994 0))(
  ( (tuple2!13995 (_1!7008 (_ BitVec 64)) (_2!7008 V!33875)) )
))
(declare-datatypes ((List!19837 0))(
  ( (Nil!19834) (Cons!19833 (h!20995 tuple2!13994) (t!28200 List!19837)) )
))
(declare-datatypes ((ListLongMap!12691 0))(
  ( (ListLongMap!12692 (toList!6361 List!19837)) )
))
(declare-fun contains!5464 (ListLongMap!12691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3594 (array!59423 array!59425 (_ BitVec 32) (_ BitVec 32) V!33875 V!33875 (_ BitVec 32) Int) ListLongMap!12691)

(assert (=> b!964950 (= lt!431185 (contains!5464 (getCurrentListMap!3594 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28580 _keys!1686) i!803)))))

(declare-fun b!964951 () Bool)

(declare-fun e!543970 () Bool)

(declare-fun e!543971 () Bool)

(declare-fun mapRes!34498 () Bool)

(assert (=> b!964951 (= e!543970 (and e!543971 mapRes!34498))))

(declare-fun condMapEmpty!34498 () Bool)

(declare-fun mapDefault!34498 () ValueCell!10353)

(assert (=> b!964951 (= condMapEmpty!34498 (= (arr!28581 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10353)) mapDefault!34498)))))

(declare-fun b!964952 () Bool)

(declare-fun res!645915 () Bool)

(assert (=> b!964952 (=> (not res!645915) (not e!543968))))

(assert (=> b!964952 (= res!645915 (and (= (size!29060 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29059 _keys!1686) (size!29060 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964953 () Bool)

(declare-fun res!645916 () Bool)

(assert (=> b!964953 (=> (not res!645916) (not e!543968))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964953 (= res!645916 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29059 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29059 _keys!1686))))))

(declare-fun res!645913 () Bool)

(assert (=> start!82734 (=> (not res!645913) (not e!543968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82734 (= res!645913 (validMask!0 mask!2110))))

(assert (=> start!82734 e!543968))

(assert (=> start!82734 true))

(declare-fun array_inv!22129 (array!59425) Bool)

(assert (=> start!82734 (and (array_inv!22129 _values!1400) e!543970)))

(declare-fun array_inv!22130 (array!59423) Bool)

(assert (=> start!82734 (array_inv!22130 _keys!1686)))

(assert (=> start!82734 tp!65721))

(declare-fun tp_is_empty!21669 () Bool)

(assert (=> start!82734 tp_is_empty!21669))

(declare-fun b!964954 () Bool)

(declare-fun res!645911 () Bool)

(assert (=> b!964954 (=> (not res!645911) (not e!543968))))

(declare-datatypes ((List!19838 0))(
  ( (Nil!19835) (Cons!19834 (h!20996 (_ BitVec 64)) (t!28201 List!19838)) )
))
(declare-fun arrayNoDuplicates!0 (array!59423 (_ BitVec 32) List!19838) Bool)

(assert (=> b!964954 (= res!645911 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19835))))

(declare-fun b!964955 () Bool)

(declare-fun e!543967 () Bool)

(assert (=> b!964955 (= e!543967 tp_is_empty!21669)))

(declare-fun mapNonEmpty!34498 () Bool)

(declare-fun tp!65720 () Bool)

(assert (=> mapNonEmpty!34498 (= mapRes!34498 (and tp!65720 e!543967))))

(declare-fun mapRest!34498 () (Array (_ BitVec 32) ValueCell!10353))

(declare-fun mapKey!34498 () (_ BitVec 32))

(declare-fun mapValue!34498 () ValueCell!10353)

(assert (=> mapNonEmpty!34498 (= (arr!28581 _values!1400) (store mapRest!34498 mapKey!34498 mapValue!34498))))

(declare-fun b!964956 () Bool)

(assert (=> b!964956 (= e!543971 tp_is_empty!21669)))

(declare-fun mapIsEmpty!34498 () Bool)

(assert (=> mapIsEmpty!34498 mapRes!34498))

(declare-fun b!964957 () Bool)

(declare-fun res!645912 () Bool)

(assert (=> b!964957 (=> (not res!645912) (not e!543968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964957 (= res!645912 (validKeyInArray!0 (select (arr!28580 _keys!1686) i!803)))))

(assert (= (and start!82734 res!645913) b!964952))

(assert (= (and b!964952 res!645915) b!964949))

(assert (= (and b!964949 res!645914) b!964954))

(assert (= (and b!964954 res!645911) b!964953))

(assert (= (and b!964953 res!645916) b!964957))

(assert (= (and b!964957 res!645912) b!964950))

(assert (= (and b!964951 condMapEmpty!34498) mapIsEmpty!34498))

(assert (= (and b!964951 (not condMapEmpty!34498)) mapNonEmpty!34498))

(get-info :version)

(assert (= (and mapNonEmpty!34498 ((_ is ValueCellFull!10353) mapValue!34498)) b!964955))

(assert (= (and b!964951 ((_ is ValueCellFull!10353) mapDefault!34498)) b!964956))

(assert (= start!82734 b!964951))

(declare-fun m!894149 () Bool)

(assert (=> start!82734 m!894149))

(declare-fun m!894151 () Bool)

(assert (=> start!82734 m!894151))

(declare-fun m!894153 () Bool)

(assert (=> start!82734 m!894153))

(declare-fun m!894155 () Bool)

(assert (=> b!964954 m!894155))

(declare-fun m!894157 () Bool)

(assert (=> b!964949 m!894157))

(declare-fun m!894159 () Bool)

(assert (=> mapNonEmpty!34498 m!894159))

(declare-fun m!894161 () Bool)

(assert (=> b!964950 m!894161))

(declare-fun m!894163 () Bool)

(assert (=> b!964950 m!894163))

(assert (=> b!964950 m!894161))

(assert (=> b!964950 m!894163))

(declare-fun m!894165 () Bool)

(assert (=> b!964950 m!894165))

(assert (=> b!964957 m!894163))

(assert (=> b!964957 m!894163))

(declare-fun m!894167 () Bool)

(assert (=> b!964957 m!894167))

(check-sat (not b!964949) (not b_next!18867) (not b!964954) (not b!964950) tp_is_empty!21669 (not b!964957) (not start!82734) (not mapNonEmpty!34498) b_and!30355)
(check-sat b_and!30355 (not b_next!18867))
