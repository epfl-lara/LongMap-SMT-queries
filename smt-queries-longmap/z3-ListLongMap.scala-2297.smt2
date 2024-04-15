; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37230 () Bool)

(assert start!37230)

(declare-fun b_free!8371 () Bool)

(declare-fun b_next!8371 () Bool)

(assert (=> start!37230 (= b_free!8371 (not b_next!8371))))

(declare-fun tp!29828 () Bool)

(declare-fun b_and!15587 () Bool)

(assert (=> start!37230 (= tp!29828 b_and!15587)))

(declare-fun b!376520 () Bool)

(declare-fun e!229279 () Bool)

(declare-fun e!229276 () Bool)

(assert (=> b!376520 (= e!229279 (not e!229276))))

(declare-fun res!212899 () Bool)

(assert (=> b!376520 (=> res!212899 e!229276)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376520 (= res!212899 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13131 0))(
  ( (V!13132 (val!4554 Int)) )
))
(declare-datatypes ((ValueCell!4166 0))(
  ( (ValueCellFull!4166 (v!6745 V!13131)) (EmptyCell!4166) )
))
(declare-datatypes ((array!21949 0))(
  ( (array!21950 (arr!10443 (Array (_ BitVec 32) ValueCell!4166)) (size!10796 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21949)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13131)

(declare-datatypes ((tuple2!6046 0))(
  ( (tuple2!6047 (_1!3034 (_ BitVec 64)) (_2!3034 V!13131)) )
))
(declare-datatypes ((List!5876 0))(
  ( (Nil!5873) (Cons!5872 (h!6728 tuple2!6046) (t!11017 List!5876)) )
))
(declare-datatypes ((ListLongMap!4949 0))(
  ( (ListLongMap!4950 (toList!2490 List!5876)) )
))
(declare-fun lt!174710 () ListLongMap!4949)

(declare-datatypes ((array!21951 0))(
  ( (array!21952 (arr!10444 (Array (_ BitVec 32) (_ BitVec 64))) (size!10797 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21951)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13131)

(declare-fun getCurrentListMap!1900 (array!21951 array!21949 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4949)

(assert (=> b!376520 (= lt!174710 (getCurrentListMap!1900 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174711 () array!21949)

(declare-fun lt!174702 () ListLongMap!4949)

(declare-fun lt!174705 () array!21951)

(assert (=> b!376520 (= lt!174702 (getCurrentListMap!1900 lt!174705 lt!174711 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174701 () ListLongMap!4949)

(declare-fun lt!174706 () ListLongMap!4949)

(assert (=> b!376520 (and (= lt!174701 lt!174706) (= lt!174706 lt!174701))))

(declare-fun lt!174704 () ListLongMap!4949)

(declare-fun lt!174699 () tuple2!6046)

(declare-fun +!858 (ListLongMap!4949 tuple2!6046) ListLongMap!4949)

(assert (=> b!376520 (= lt!174706 (+!858 lt!174704 lt!174699))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13131)

(assert (=> b!376520 (= lt!174699 (tuple2!6047 k0!778 v!373))))

(declare-datatypes ((Unit!11586 0))(
  ( (Unit!11587) )
))
(declare-fun lt!174708 () Unit!11586)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 (array!21951 array!21949 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) (_ BitVec 64) V!13131 (_ BitVec 32) Int) Unit!11586)

(assert (=> b!376520 (= lt!174708 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!765 (array!21951 array!21949 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4949)

(assert (=> b!376520 (= lt!174701 (getCurrentListMapNoExtraKeys!765 lt!174705 lt!174711 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376520 (= lt!174711 (array!21950 (store (arr!10443 _values!506) i!548 (ValueCellFull!4166 v!373)) (size!10796 _values!506)))))

(assert (=> b!376520 (= lt!174704 (getCurrentListMapNoExtraKeys!765 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376521 () Bool)

(declare-fun res!212904 () Bool)

(assert (=> b!376521 (=> (not res!212904) (not e!229279))))

(declare-datatypes ((List!5877 0))(
  ( (Nil!5874) (Cons!5873 (h!6729 (_ BitVec 64)) (t!11018 List!5877)) )
))
(declare-fun arrayNoDuplicates!0 (array!21951 (_ BitVec 32) List!5877) Bool)

(assert (=> b!376521 (= res!212904 (arrayNoDuplicates!0 lt!174705 #b00000000000000000000000000000000 Nil!5874))))

(declare-fun b!376522 () Bool)

(declare-fun res!212907 () Bool)

(declare-fun e!229274 () Bool)

(assert (=> b!376522 (=> (not res!212907) (not e!229274))))

(assert (=> b!376522 (= res!212907 (and (= (size!10796 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10797 _keys!658) (size!10796 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376523 () Bool)

(declare-fun e!229280 () Bool)

(assert (=> b!376523 (= e!229276 e!229280)))

(declare-fun res!212909 () Bool)

(assert (=> b!376523 (=> res!212909 e!229280)))

(assert (=> b!376523 (= res!212909 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174707 () ListLongMap!4949)

(assert (=> b!376523 (= lt!174702 lt!174707)))

(declare-fun lt!174703 () tuple2!6046)

(assert (=> b!376523 (= lt!174707 (+!858 lt!174706 lt!174703))))

(declare-fun lt!174700 () ListLongMap!4949)

(assert (=> b!376523 (= lt!174710 lt!174700)))

(assert (=> b!376523 (= lt!174700 (+!858 lt!174704 lt!174703))))

(assert (=> b!376523 (= lt!174702 (+!858 lt!174701 lt!174703))))

(assert (=> b!376523 (= lt!174703 (tuple2!6047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376524 () Bool)

(declare-fun res!212898 () Bool)

(assert (=> b!376524 (=> (not res!212898) (not e!229274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376524 (= res!212898 (validKeyInArray!0 k0!778))))

(declare-fun res!212902 () Bool)

(assert (=> start!37230 (=> (not res!212902) (not e!229274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37230 (= res!212902 (validMask!0 mask!970))))

(assert (=> start!37230 e!229274))

(declare-fun e!229278 () Bool)

(declare-fun array_inv!7700 (array!21949) Bool)

(assert (=> start!37230 (and (array_inv!7700 _values!506) e!229278)))

(assert (=> start!37230 tp!29828))

(assert (=> start!37230 true))

(declare-fun tp_is_empty!9019 () Bool)

(assert (=> start!37230 tp_is_empty!9019))

(declare-fun array_inv!7701 (array!21951) Bool)

(assert (=> start!37230 (array_inv!7701 _keys!658)))

(declare-fun b!376525 () Bool)

(assert (=> b!376525 (= e!229274 e!229279)))

(declare-fun res!212908 () Bool)

(assert (=> b!376525 (=> (not res!212908) (not e!229279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21951 (_ BitVec 32)) Bool)

(assert (=> b!376525 (= res!212908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174705 mask!970))))

(assert (=> b!376525 (= lt!174705 (array!21952 (store (arr!10444 _keys!658) i!548 k0!778) (size!10797 _keys!658)))))

(declare-fun mapNonEmpty!15093 () Bool)

(declare-fun mapRes!15093 () Bool)

(declare-fun tp!29829 () Bool)

(declare-fun e!229275 () Bool)

(assert (=> mapNonEmpty!15093 (= mapRes!15093 (and tp!29829 e!229275))))

(declare-fun mapValue!15093 () ValueCell!4166)

(declare-fun mapKey!15093 () (_ BitVec 32))

(declare-fun mapRest!15093 () (Array (_ BitVec 32) ValueCell!4166))

(assert (=> mapNonEmpty!15093 (= (arr!10443 _values!506) (store mapRest!15093 mapKey!15093 mapValue!15093))))

(declare-fun b!376526 () Bool)

(assert (=> b!376526 (= e!229275 tp_is_empty!9019)))

(declare-fun mapIsEmpty!15093 () Bool)

(assert (=> mapIsEmpty!15093 mapRes!15093))

(declare-fun b!376527 () Bool)

(declare-fun e!229273 () Bool)

(assert (=> b!376527 (= e!229278 (and e!229273 mapRes!15093))))

(declare-fun condMapEmpty!15093 () Bool)

(declare-fun mapDefault!15093 () ValueCell!4166)

(assert (=> b!376527 (= condMapEmpty!15093 (= (arr!10443 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4166)) mapDefault!15093)))))

(declare-fun b!376528 () Bool)

(declare-fun res!212903 () Bool)

(assert (=> b!376528 (=> (not res!212903) (not e!229274))))

(assert (=> b!376528 (= res!212903 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10797 _keys!658))))))

(declare-fun b!376529 () Bool)

(declare-fun res!212900 () Bool)

(assert (=> b!376529 (=> (not res!212900) (not e!229274))))

(declare-fun arrayContainsKey!0 (array!21951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376529 (= res!212900 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376530 () Bool)

(declare-fun res!212905 () Bool)

(assert (=> b!376530 (=> (not res!212905) (not e!229274))))

(assert (=> b!376530 (= res!212905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376531 () Bool)

(declare-fun res!212906 () Bool)

(assert (=> b!376531 (=> (not res!212906) (not e!229274))))

(assert (=> b!376531 (= res!212906 (or (= (select (arr!10444 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10444 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376532 () Bool)

(assert (=> b!376532 (= e!229273 tp_is_empty!9019)))

(declare-fun b!376533 () Bool)

(declare-fun res!212901 () Bool)

(assert (=> b!376533 (=> (not res!212901) (not e!229274))))

(assert (=> b!376533 (= res!212901 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5874))))

(declare-fun b!376534 () Bool)

(assert (=> b!376534 (= e!229280 true)))

(assert (=> b!376534 (= lt!174707 (+!858 lt!174700 lt!174699))))

(declare-fun lt!174709 () Unit!11586)

(declare-fun addCommutativeForDiffKeys!267 (ListLongMap!4949 (_ BitVec 64) V!13131 (_ BitVec 64) V!13131) Unit!11586)

(assert (=> b!376534 (= lt!174709 (addCommutativeForDiffKeys!267 lt!174704 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37230 res!212902) b!376522))

(assert (= (and b!376522 res!212907) b!376530))

(assert (= (and b!376530 res!212905) b!376533))

(assert (= (and b!376533 res!212901) b!376528))

(assert (= (and b!376528 res!212903) b!376524))

(assert (= (and b!376524 res!212898) b!376531))

(assert (= (and b!376531 res!212906) b!376529))

(assert (= (and b!376529 res!212900) b!376525))

(assert (= (and b!376525 res!212908) b!376521))

(assert (= (and b!376521 res!212904) b!376520))

(assert (= (and b!376520 (not res!212899)) b!376523))

(assert (= (and b!376523 (not res!212909)) b!376534))

(assert (= (and b!376527 condMapEmpty!15093) mapIsEmpty!15093))

(assert (= (and b!376527 (not condMapEmpty!15093)) mapNonEmpty!15093))

(get-info :version)

(assert (= (and mapNonEmpty!15093 ((_ is ValueCellFull!4166) mapValue!15093)) b!376526))

(assert (= (and b!376527 ((_ is ValueCellFull!4166) mapDefault!15093)) b!376532))

(assert (= start!37230 b!376527))

(declare-fun m!372791 () Bool)

(assert (=> b!376531 m!372791))

(declare-fun m!372793 () Bool)

(assert (=> mapNonEmpty!15093 m!372793))

(declare-fun m!372795 () Bool)

(assert (=> b!376523 m!372795))

(declare-fun m!372797 () Bool)

(assert (=> b!376523 m!372797))

(declare-fun m!372799 () Bool)

(assert (=> b!376523 m!372799))

(declare-fun m!372801 () Bool)

(assert (=> b!376534 m!372801))

(declare-fun m!372803 () Bool)

(assert (=> b!376534 m!372803))

(declare-fun m!372805 () Bool)

(assert (=> b!376529 m!372805))

(declare-fun m!372807 () Bool)

(assert (=> start!37230 m!372807))

(declare-fun m!372809 () Bool)

(assert (=> start!37230 m!372809))

(declare-fun m!372811 () Bool)

(assert (=> start!37230 m!372811))

(declare-fun m!372813 () Bool)

(assert (=> b!376521 m!372813))

(declare-fun m!372815 () Bool)

(assert (=> b!376533 m!372815))

(declare-fun m!372817 () Bool)

(assert (=> b!376530 m!372817))

(declare-fun m!372819 () Bool)

(assert (=> b!376524 m!372819))

(declare-fun m!372821 () Bool)

(assert (=> b!376520 m!372821))

(declare-fun m!372823 () Bool)

(assert (=> b!376520 m!372823))

(declare-fun m!372825 () Bool)

(assert (=> b!376520 m!372825))

(declare-fun m!372827 () Bool)

(assert (=> b!376520 m!372827))

(declare-fun m!372829 () Bool)

(assert (=> b!376520 m!372829))

(declare-fun m!372831 () Bool)

(assert (=> b!376520 m!372831))

(declare-fun m!372833 () Bool)

(assert (=> b!376520 m!372833))

(declare-fun m!372835 () Bool)

(assert (=> b!376525 m!372835))

(declare-fun m!372837 () Bool)

(assert (=> b!376525 m!372837))

(check-sat b_and!15587 (not b!376530) (not b!376529) (not b!376520) (not b_next!8371) (not start!37230) (not b!376534) (not b!376521) (not mapNonEmpty!15093) (not b!376525) (not b!376523) (not b!376524) tp_is_empty!9019 (not b!376533))
(check-sat b_and!15587 (not b_next!8371))
