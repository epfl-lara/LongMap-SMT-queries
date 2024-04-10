; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37792 () Bool)

(assert start!37792)

(declare-fun b_free!8895 () Bool)

(declare-fun b_next!8895 () Bool)

(assert (=> start!37792 (= b_free!8895 (not b_next!8895))))

(declare-fun tp!31437 () Bool)

(declare-fun b_and!16137 () Bool)

(assert (=> start!37792 (= tp!31437 b_and!16137)))

(declare-fun b!388157 () Bool)

(declare-fun e!235221 () Bool)

(declare-fun e!235222 () Bool)

(declare-fun mapRes!15915 () Bool)

(assert (=> b!388157 (= e!235221 (and e!235222 mapRes!15915))))

(declare-fun condMapEmpty!15915 () Bool)

(declare-datatypes ((V!13861 0))(
  ( (V!13862 (val!4828 Int)) )
))
(declare-datatypes ((ValueCell!4440 0))(
  ( (ValueCellFull!4440 (v!7025 V!13861)) (EmptyCell!4440) )
))
(declare-datatypes ((array!23025 0))(
  ( (array!23026 (arr!10981 (Array (_ BitVec 32) ValueCell!4440)) (size!11333 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23025)

(declare-fun mapDefault!15915 () ValueCell!4440)

(assert (=> b!388157 (= condMapEmpty!15915 (= (arr!10981 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4440)) mapDefault!15915)))))

(declare-fun b!388158 () Bool)

(declare-fun res!221936 () Bool)

(declare-fun e!235225 () Bool)

(assert (=> b!388158 (=> (not res!221936) (not e!235225))))

(declare-datatypes ((array!23027 0))(
  ( (array!23028 (arr!10982 (Array (_ BitVec 32) (_ BitVec 64))) (size!11334 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23027)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23027 (_ BitVec 32)) Bool)

(assert (=> b!388158 (= res!221936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388159 () Bool)

(declare-fun e!235226 () Bool)

(assert (=> b!388159 (= e!235225 e!235226)))

(declare-fun res!221934 () Bool)

(assert (=> b!388159 (=> (not res!221934) (not e!235226))))

(declare-fun lt!182233 () array!23027)

(assert (=> b!388159 (= res!221934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182233 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388159 (= lt!182233 (array!23028 (store (arr!10982 _keys!658) i!548 k0!778) (size!11334 _keys!658)))))

(declare-fun b!388160 () Bool)

(declare-fun res!221931 () Bool)

(assert (=> b!388160 (=> (not res!221931) (not e!235225))))

(declare-datatypes ((List!6343 0))(
  ( (Nil!6340) (Cons!6339 (h!7195 (_ BitVec 64)) (t!11493 List!6343)) )
))
(declare-fun arrayNoDuplicates!0 (array!23027 (_ BitVec 32) List!6343) Bool)

(assert (=> b!388160 (= res!221931 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6340))))

(declare-fun b!388161 () Bool)

(declare-fun res!221933 () Bool)

(assert (=> b!388161 (=> (not res!221933) (not e!235225))))

(assert (=> b!388161 (= res!221933 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11334 _keys!658))))))

(declare-fun res!221930 () Bool)

(assert (=> start!37792 (=> (not res!221930) (not e!235225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37792 (= res!221930 (validMask!0 mask!970))))

(assert (=> start!37792 e!235225))

(declare-fun array_inv!8074 (array!23025) Bool)

(assert (=> start!37792 (and (array_inv!8074 _values!506) e!235221)))

(assert (=> start!37792 tp!31437))

(assert (=> start!37792 true))

(declare-fun tp_is_empty!9567 () Bool)

(assert (=> start!37792 tp_is_empty!9567))

(declare-fun array_inv!8075 (array!23027) Bool)

(assert (=> start!37792 (array_inv!8075 _keys!658)))

(declare-fun b!388162 () Bool)

(declare-fun res!221932 () Bool)

(assert (=> b!388162 (=> (not res!221932) (not e!235225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388162 (= res!221932 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15915 () Bool)

(declare-fun tp!31436 () Bool)

(declare-fun e!235223 () Bool)

(assert (=> mapNonEmpty!15915 (= mapRes!15915 (and tp!31436 e!235223))))

(declare-fun mapValue!15915 () ValueCell!4440)

(declare-fun mapKey!15915 () (_ BitVec 32))

(declare-fun mapRest!15915 () (Array (_ BitVec 32) ValueCell!4440))

(assert (=> mapNonEmpty!15915 (= (arr!10981 _values!506) (store mapRest!15915 mapKey!15915 mapValue!15915))))

(declare-fun b!388163 () Bool)

(assert (=> b!388163 (= e!235226 (not true))))

(declare-datatypes ((tuple2!6490 0))(
  ( (tuple2!6491 (_1!3256 (_ BitVec 64)) (_2!3256 V!13861)) )
))
(declare-datatypes ((List!6344 0))(
  ( (Nil!6341) (Cons!6340 (h!7196 tuple2!6490) (t!11494 List!6344)) )
))
(declare-datatypes ((ListLongMap!5403 0))(
  ( (ListLongMap!5404 (toList!2717 List!6344)) )
))
(declare-fun lt!182231 () ListLongMap!5403)

(declare-fun lt!182234 () ListLongMap!5403)

(assert (=> b!388163 (and (= lt!182231 lt!182234) (= lt!182234 lt!182231))))

(declare-fun v!373 () V!13861)

(declare-fun lt!182235 () ListLongMap!5403)

(declare-fun +!1012 (ListLongMap!5403 tuple2!6490) ListLongMap!5403)

(assert (=> b!388163 (= lt!182234 (+!1012 lt!182235 (tuple2!6491 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13861)

(declare-datatypes ((Unit!11898 0))(
  ( (Unit!11899) )
))
(declare-fun lt!182232 () Unit!11898)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun minValue!472 () V!13861)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!230 (array!23027 array!23025 (_ BitVec 32) (_ BitVec 32) V!13861 V!13861 (_ BitVec 32) (_ BitVec 64) V!13861 (_ BitVec 32) Int) Unit!11898)

(assert (=> b!388163 (= lt!182232 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!230 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!946 (array!23027 array!23025 (_ BitVec 32) (_ BitVec 32) V!13861 V!13861 (_ BitVec 32) Int) ListLongMap!5403)

(assert (=> b!388163 (= lt!182231 (getCurrentListMapNoExtraKeys!946 lt!182233 (array!23026 (store (arr!10981 _values!506) i!548 (ValueCellFull!4440 v!373)) (size!11333 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388163 (= lt!182235 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388164 () Bool)

(declare-fun res!221928 () Bool)

(assert (=> b!388164 (=> (not res!221928) (not e!235225))))

(declare-fun arrayContainsKey!0 (array!23027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388164 (= res!221928 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388165 () Bool)

(declare-fun res!221927 () Bool)

(assert (=> b!388165 (=> (not res!221927) (not e!235225))))

(assert (=> b!388165 (= res!221927 (or (= (select (arr!10982 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10982 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388166 () Bool)

(assert (=> b!388166 (= e!235222 tp_is_empty!9567)))

(declare-fun b!388167 () Bool)

(assert (=> b!388167 (= e!235223 tp_is_empty!9567)))

(declare-fun mapIsEmpty!15915 () Bool)

(assert (=> mapIsEmpty!15915 mapRes!15915))

(declare-fun b!388168 () Bool)

(declare-fun res!221929 () Bool)

(assert (=> b!388168 (=> (not res!221929) (not e!235225))))

(assert (=> b!388168 (= res!221929 (and (= (size!11333 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11334 _keys!658) (size!11333 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388169 () Bool)

(declare-fun res!221935 () Bool)

(assert (=> b!388169 (=> (not res!221935) (not e!235226))))

(assert (=> b!388169 (= res!221935 (arrayNoDuplicates!0 lt!182233 #b00000000000000000000000000000000 Nil!6340))))

(assert (= (and start!37792 res!221930) b!388168))

(assert (= (and b!388168 res!221929) b!388158))

(assert (= (and b!388158 res!221936) b!388160))

(assert (= (and b!388160 res!221931) b!388161))

(assert (= (and b!388161 res!221933) b!388162))

(assert (= (and b!388162 res!221932) b!388165))

(assert (= (and b!388165 res!221927) b!388164))

(assert (= (and b!388164 res!221928) b!388159))

(assert (= (and b!388159 res!221934) b!388169))

(assert (= (and b!388169 res!221935) b!388163))

(assert (= (and b!388157 condMapEmpty!15915) mapIsEmpty!15915))

(assert (= (and b!388157 (not condMapEmpty!15915)) mapNonEmpty!15915))

(get-info :version)

(assert (= (and mapNonEmpty!15915 ((_ is ValueCellFull!4440) mapValue!15915)) b!388167))

(assert (= (and b!388157 ((_ is ValueCellFull!4440) mapDefault!15915)) b!388166))

(assert (= start!37792 b!388157))

(declare-fun m!384121 () Bool)

(assert (=> b!388162 m!384121))

(declare-fun m!384123 () Bool)

(assert (=> b!388163 m!384123))

(declare-fun m!384125 () Bool)

(assert (=> b!388163 m!384125))

(declare-fun m!384127 () Bool)

(assert (=> b!388163 m!384127))

(declare-fun m!384129 () Bool)

(assert (=> b!388163 m!384129))

(declare-fun m!384131 () Bool)

(assert (=> b!388163 m!384131))

(declare-fun m!384133 () Bool)

(assert (=> mapNonEmpty!15915 m!384133))

(declare-fun m!384135 () Bool)

(assert (=> start!37792 m!384135))

(declare-fun m!384137 () Bool)

(assert (=> start!37792 m!384137))

(declare-fun m!384139 () Bool)

(assert (=> start!37792 m!384139))

(declare-fun m!384141 () Bool)

(assert (=> b!388165 m!384141))

(declare-fun m!384143 () Bool)

(assert (=> b!388169 m!384143))

(declare-fun m!384145 () Bool)

(assert (=> b!388164 m!384145))

(declare-fun m!384147 () Bool)

(assert (=> b!388160 m!384147))

(declare-fun m!384149 () Bool)

(assert (=> b!388158 m!384149))

(declare-fun m!384151 () Bool)

(assert (=> b!388159 m!384151))

(declare-fun m!384153 () Bool)

(assert (=> b!388159 m!384153))

(check-sat (not mapNonEmpty!15915) (not b!388169) (not b!388163) b_and!16137 (not b!388162) (not start!37792) (not b!388159) (not b!388158) tp_is_empty!9567 (not b_next!8895) (not b!388160) (not b!388164))
(check-sat b_and!16137 (not b_next!8895))
