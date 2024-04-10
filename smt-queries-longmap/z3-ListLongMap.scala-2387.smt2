; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37786 () Bool)

(assert start!37786)

(declare-fun b_free!8889 () Bool)

(declare-fun b_next!8889 () Bool)

(assert (=> start!37786 (= b_free!8889 (not b_next!8889))))

(declare-fun tp!31419 () Bool)

(declare-fun b_and!16131 () Bool)

(assert (=> start!37786 (= tp!31419 b_and!16131)))

(declare-fun b!388040 () Bool)

(declare-fun e!235168 () Bool)

(declare-fun tp_is_empty!9561 () Bool)

(assert (=> b!388040 (= e!235168 tp_is_empty!9561)))

(declare-fun b!388041 () Bool)

(declare-fun e!235167 () Bool)

(declare-fun e!235169 () Bool)

(assert (=> b!388041 (= e!235167 e!235169)))

(declare-fun res!221841 () Bool)

(assert (=> b!388041 (=> (not res!221841) (not e!235169))))

(declare-datatypes ((array!23013 0))(
  ( (array!23014 (arr!10975 (Array (_ BitVec 32) (_ BitVec 64))) (size!11327 (_ BitVec 32))) )
))
(declare-fun lt!182187 () array!23013)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23013 (_ BitVec 32)) Bool)

(assert (=> b!388041 (= res!221841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182187 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23013)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388041 (= lt!182187 (array!23014 (store (arr!10975 _keys!658) i!548 k0!778) (size!11327 _keys!658)))))

(declare-fun b!388042 () Bool)

(declare-fun res!221837 () Bool)

(assert (=> b!388042 (=> (not res!221837) (not e!235167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388042 (= res!221837 (validKeyInArray!0 k0!778))))

(declare-fun res!221838 () Bool)

(assert (=> start!37786 (=> (not res!221838) (not e!235167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37786 (= res!221838 (validMask!0 mask!970))))

(assert (=> start!37786 e!235167))

(declare-datatypes ((V!13853 0))(
  ( (V!13854 (val!4825 Int)) )
))
(declare-datatypes ((ValueCell!4437 0))(
  ( (ValueCellFull!4437 (v!7022 V!13853)) (EmptyCell!4437) )
))
(declare-datatypes ((array!23015 0))(
  ( (array!23016 (arr!10976 (Array (_ BitVec 32) ValueCell!4437)) (size!11328 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23015)

(declare-fun e!235171 () Bool)

(declare-fun array_inv!8070 (array!23015) Bool)

(assert (=> start!37786 (and (array_inv!8070 _values!506) e!235171)))

(assert (=> start!37786 tp!31419))

(assert (=> start!37786 true))

(assert (=> start!37786 tp_is_empty!9561))

(declare-fun array_inv!8071 (array!23013) Bool)

(assert (=> start!37786 (array_inv!8071 _keys!658)))

(declare-fun b!388043 () Bool)

(declare-fun res!221842 () Bool)

(assert (=> b!388043 (=> (not res!221842) (not e!235167))))

(assert (=> b!388043 (= res!221842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15906 () Bool)

(declare-fun mapRes!15906 () Bool)

(assert (=> mapIsEmpty!15906 mapRes!15906))

(declare-fun b!388044 () Bool)

(declare-fun res!221845 () Bool)

(assert (=> b!388044 (=> (not res!221845) (not e!235167))))

(declare-datatypes ((List!6338 0))(
  ( (Nil!6335) (Cons!6334 (h!7190 (_ BitVec 64)) (t!11488 List!6338)) )
))
(declare-fun arrayNoDuplicates!0 (array!23013 (_ BitVec 32) List!6338) Bool)

(assert (=> b!388044 (= res!221845 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6335))))

(declare-fun b!388045 () Bool)

(declare-fun res!221844 () Bool)

(assert (=> b!388045 (=> (not res!221844) (not e!235167))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388045 (= res!221844 (and (= (size!11328 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11327 _keys!658) (size!11328 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388046 () Bool)

(declare-fun e!235170 () Bool)

(assert (=> b!388046 (= e!235171 (and e!235170 mapRes!15906))))

(declare-fun condMapEmpty!15906 () Bool)

(declare-fun mapDefault!15906 () ValueCell!4437)

(assert (=> b!388046 (= condMapEmpty!15906 (= (arr!10976 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4437)) mapDefault!15906)))))

(declare-fun b!388047 () Bool)

(declare-fun res!221846 () Bool)

(assert (=> b!388047 (=> (not res!221846) (not e!235167))))

(assert (=> b!388047 (= res!221846 (or (= (select (arr!10975 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10975 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388048 () Bool)

(declare-fun res!221839 () Bool)

(assert (=> b!388048 (=> (not res!221839) (not e!235169))))

(assert (=> b!388048 (= res!221839 (arrayNoDuplicates!0 lt!182187 #b00000000000000000000000000000000 Nil!6335))))

(declare-fun mapNonEmpty!15906 () Bool)

(declare-fun tp!31418 () Bool)

(assert (=> mapNonEmpty!15906 (= mapRes!15906 (and tp!31418 e!235168))))

(declare-fun mapKey!15906 () (_ BitVec 32))

(declare-fun mapValue!15906 () ValueCell!4437)

(declare-fun mapRest!15906 () (Array (_ BitVec 32) ValueCell!4437))

(assert (=> mapNonEmpty!15906 (= (arr!10976 _values!506) (store mapRest!15906 mapKey!15906 mapValue!15906))))

(declare-fun b!388049 () Bool)

(assert (=> b!388049 (= e!235170 tp_is_empty!9561)))

(declare-fun b!388050 () Bool)

(declare-datatypes ((tuple2!6486 0))(
  ( (tuple2!6487 (_1!3254 (_ BitVec 64)) (_2!3254 V!13853)) )
))
(declare-datatypes ((List!6339 0))(
  ( (Nil!6336) (Cons!6335 (h!7191 tuple2!6486) (t!11489 List!6339)) )
))
(declare-datatypes ((ListLongMap!5399 0))(
  ( (ListLongMap!5400 (toList!2715 List!6339)) )
))
(declare-fun lt!182186 () ListLongMap!5399)

(declare-fun lt!182188 () ListLongMap!5399)

(assert (=> b!388050 (= e!235169 (not (= lt!182186 lt!182188)))))

(assert (=> b!388050 (= lt!182188 lt!182186)))

(declare-fun v!373 () V!13853)

(declare-fun lt!182189 () ListLongMap!5399)

(declare-fun +!1010 (ListLongMap!5399 tuple2!6486) ListLongMap!5399)

(assert (=> b!388050 (= lt!182186 (+!1010 lt!182189 (tuple2!6487 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13853)

(declare-datatypes ((Unit!11894 0))(
  ( (Unit!11895) )
))
(declare-fun lt!182190 () Unit!11894)

(declare-fun minValue!472 () V!13853)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!228 (array!23013 array!23015 (_ BitVec 32) (_ BitVec 32) V!13853 V!13853 (_ BitVec 32) (_ BitVec 64) V!13853 (_ BitVec 32) Int) Unit!11894)

(assert (=> b!388050 (= lt!182190 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!228 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!944 (array!23013 array!23015 (_ BitVec 32) (_ BitVec 32) V!13853 V!13853 (_ BitVec 32) Int) ListLongMap!5399)

(assert (=> b!388050 (= lt!182188 (getCurrentListMapNoExtraKeys!944 lt!182187 (array!23016 (store (arr!10976 _values!506) i!548 (ValueCellFull!4437 v!373)) (size!11328 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388050 (= lt!182189 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388051 () Bool)

(declare-fun res!221840 () Bool)

(assert (=> b!388051 (=> (not res!221840) (not e!235167))))

(assert (=> b!388051 (= res!221840 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11327 _keys!658))))))

(declare-fun b!388052 () Bool)

(declare-fun res!221843 () Bool)

(assert (=> b!388052 (=> (not res!221843) (not e!235167))))

(declare-fun arrayContainsKey!0 (array!23013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388052 (= res!221843 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37786 res!221838) b!388045))

(assert (= (and b!388045 res!221844) b!388043))

(assert (= (and b!388043 res!221842) b!388044))

(assert (= (and b!388044 res!221845) b!388051))

(assert (= (and b!388051 res!221840) b!388042))

(assert (= (and b!388042 res!221837) b!388047))

(assert (= (and b!388047 res!221846) b!388052))

(assert (= (and b!388052 res!221843) b!388041))

(assert (= (and b!388041 res!221841) b!388048))

(assert (= (and b!388048 res!221839) b!388050))

(assert (= (and b!388046 condMapEmpty!15906) mapIsEmpty!15906))

(assert (= (and b!388046 (not condMapEmpty!15906)) mapNonEmpty!15906))

(get-info :version)

(assert (= (and mapNonEmpty!15906 ((_ is ValueCellFull!4437) mapValue!15906)) b!388040))

(assert (= (and b!388046 ((_ is ValueCellFull!4437) mapDefault!15906)) b!388049))

(assert (= start!37786 b!388046))

(declare-fun m!384019 () Bool)

(assert (=> b!388048 m!384019))

(declare-fun m!384021 () Bool)

(assert (=> b!388044 m!384021))

(declare-fun m!384023 () Bool)

(assert (=> mapNonEmpty!15906 m!384023))

(declare-fun m!384025 () Bool)

(assert (=> b!388041 m!384025))

(declare-fun m!384027 () Bool)

(assert (=> b!388041 m!384027))

(declare-fun m!384029 () Bool)

(assert (=> b!388042 m!384029))

(declare-fun m!384031 () Bool)

(assert (=> start!37786 m!384031))

(declare-fun m!384033 () Bool)

(assert (=> start!37786 m!384033))

(declare-fun m!384035 () Bool)

(assert (=> start!37786 m!384035))

(declare-fun m!384037 () Bool)

(assert (=> b!388052 m!384037))

(declare-fun m!384039 () Bool)

(assert (=> b!388047 m!384039))

(declare-fun m!384041 () Bool)

(assert (=> b!388043 m!384041))

(declare-fun m!384043 () Bool)

(assert (=> b!388050 m!384043))

(declare-fun m!384045 () Bool)

(assert (=> b!388050 m!384045))

(declare-fun m!384047 () Bool)

(assert (=> b!388050 m!384047))

(declare-fun m!384049 () Bool)

(assert (=> b!388050 m!384049))

(declare-fun m!384051 () Bool)

(assert (=> b!388050 m!384051))

(check-sat (not b_next!8889) (not b!388043) tp_is_empty!9561 (not start!37786) (not b!388041) (not b!388044) (not b!388050) (not b!388052) (not b!388042) (not mapNonEmpty!15906) (not b!388048) b_and!16131)
(check-sat b_and!16131 (not b_next!8889))
