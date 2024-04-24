; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37110 () Bool)

(assert start!37110)

(declare-fun b_free!8251 () Bool)

(declare-fun b_next!8251 () Bool)

(assert (=> start!37110 (= b_free!8251 (not b_next!8251))))

(declare-fun tp!29468 () Bool)

(declare-fun b_and!15507 () Bool)

(assert (=> start!37110 (= tp!29468 b_and!15507)))

(declare-fun b!374033 () Bool)

(declare-fun res!210857 () Bool)

(declare-fun e!227981 () Bool)

(assert (=> b!374033 (=> (not res!210857) (not e!227981))))

(declare-datatypes ((array!21718 0))(
  ( (array!21719 (arr!10327 (Array (_ BitVec 32) (_ BitVec 64))) (size!10679 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21718)

(declare-datatypes ((List!5719 0))(
  ( (Nil!5716) (Cons!5715 (h!6571 (_ BitVec 64)) (t!10861 List!5719)) )
))
(declare-fun arrayNoDuplicates!0 (array!21718 (_ BitVec 32) List!5719) Bool)

(assert (=> b!374033 (= res!210857 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5716))))

(declare-fun mapNonEmpty!14913 () Bool)

(declare-fun mapRes!14913 () Bool)

(declare-fun tp!29469 () Bool)

(declare-fun e!227982 () Bool)

(assert (=> mapNonEmpty!14913 (= mapRes!14913 (and tp!29469 e!227982))))

(declare-datatypes ((V!12971 0))(
  ( (V!12972 (val!4494 Int)) )
))
(declare-datatypes ((ValueCell!4106 0))(
  ( (ValueCellFull!4106 (v!6692 V!12971)) (EmptyCell!4106) )
))
(declare-datatypes ((array!21720 0))(
  ( (array!21721 (arr!10328 (Array (_ BitVec 32) ValueCell!4106)) (size!10680 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21720)

(declare-fun mapValue!14913 () ValueCell!4106)

(declare-fun mapRest!14913 () (Array (_ BitVec 32) ValueCell!4106))

(declare-fun mapKey!14913 () (_ BitVec 32))

(assert (=> mapNonEmpty!14913 (= (arr!10328 _values!506) (store mapRest!14913 mapKey!14913 mapValue!14913))))

(declare-fun b!374034 () Bool)

(declare-fun e!227979 () Bool)

(assert (=> b!374034 (= e!227979 true)))

(declare-datatypes ((tuple2!5874 0))(
  ( (tuple2!5875 (_1!2948 (_ BitVec 64)) (_2!2948 V!12971)) )
))
(declare-datatypes ((List!5720 0))(
  ( (Nil!5717) (Cons!5716 (h!6572 tuple2!5874) (t!10862 List!5720)) )
))
(declare-datatypes ((ListLongMap!4789 0))(
  ( (ListLongMap!4790 (toList!2410 List!5720)) )
))
(declare-fun lt!172229 () ListLongMap!4789)

(declare-fun lt!172240 () tuple2!5874)

(declare-fun lt!172239 () tuple2!5874)

(declare-fun lt!172227 () ListLongMap!4789)

(declare-fun +!806 (ListLongMap!4789 tuple2!5874) ListLongMap!4789)

(assert (=> b!374034 (= (+!806 lt!172229 lt!172239) (+!806 lt!172227 lt!172240))))

(declare-fun v!373 () V!12971)

(declare-fun lt!172226 () ListLongMap!4789)

(declare-datatypes ((Unit!11501 0))(
  ( (Unit!11502) )
))
(declare-fun lt!172232 () Unit!11501)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12971)

(declare-fun addCommutativeForDiffKeys!234 (ListLongMap!4789 (_ BitVec 64) V!12971 (_ BitVec 64) V!12971) Unit!11501)

(assert (=> b!374034 (= lt!172232 (addCommutativeForDiffKeys!234 lt!172226 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374035 () Bool)

(declare-fun res!210855 () Bool)

(assert (=> b!374035 (=> (not res!210855) (not e!227981))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374035 (= res!210855 (or (= (select (arr!10327 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10327 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374036 () Bool)

(declare-fun res!210856 () Bool)

(assert (=> b!374036 (=> (not res!210856) (not e!227981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374036 (= res!210856 (validKeyInArray!0 k0!778))))

(declare-fun b!374038 () Bool)

(declare-fun e!227975 () Bool)

(declare-fun e!227977 () Bool)

(assert (=> b!374038 (= e!227975 (not e!227977))))

(declare-fun res!210861 () Bool)

(assert (=> b!374038 (=> res!210861 e!227977)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374038 (= res!210861 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!172234 () ListLongMap!4789)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12971)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1870 (array!21718 array!21720 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4789)

(assert (=> b!374038 (= lt!172234 (getCurrentListMap!1870 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172237 () array!21718)

(declare-fun lt!172238 () ListLongMap!4789)

(declare-fun lt!172236 () array!21720)

(assert (=> b!374038 (= lt!172238 (getCurrentListMap!1870 lt!172237 lt!172236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172235 () ListLongMap!4789)

(declare-fun lt!172225 () ListLongMap!4789)

(assert (=> b!374038 (and (= lt!172235 lt!172225) (= lt!172225 lt!172235))))

(declare-fun lt!172231 () ListLongMap!4789)

(assert (=> b!374038 (= lt!172225 (+!806 lt!172231 lt!172240))))

(assert (=> b!374038 (= lt!172240 (tuple2!5875 k0!778 v!373))))

(declare-fun lt!172233 () Unit!11501)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 (array!21718 array!21720 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) (_ BitVec 64) V!12971 (_ BitVec 32) Int) Unit!11501)

(assert (=> b!374038 (= lt!172233 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!717 (array!21718 array!21720 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4789)

(assert (=> b!374038 (= lt!172235 (getCurrentListMapNoExtraKeys!717 lt!172237 lt!172236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374038 (= lt!172236 (array!21721 (store (arr!10328 _values!506) i!548 (ValueCellFull!4106 v!373)) (size!10680 _values!506)))))

(assert (=> b!374038 (= lt!172231 (getCurrentListMapNoExtraKeys!717 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374039 () Bool)

(declare-fun res!210864 () Bool)

(assert (=> b!374039 (=> (not res!210864) (not e!227981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21718 (_ BitVec 32)) Bool)

(assert (=> b!374039 (= res!210864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374040 () Bool)

(declare-fun res!210860 () Bool)

(assert (=> b!374040 (=> (not res!210860) (not e!227975))))

(assert (=> b!374040 (= res!210860 (arrayNoDuplicates!0 lt!172237 #b00000000000000000000000000000000 Nil!5716))))

(declare-fun b!374041 () Bool)

(declare-fun res!210859 () Bool)

(assert (=> b!374041 (=> (not res!210859) (not e!227981))))

(declare-fun arrayContainsKey!0 (array!21718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374041 (= res!210859 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374042 () Bool)

(declare-fun res!210863 () Bool)

(assert (=> b!374042 (=> (not res!210863) (not e!227981))))

(assert (=> b!374042 (= res!210863 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10679 _keys!658))))))

(declare-fun b!374043 () Bool)

(assert (=> b!374043 (= e!227981 e!227975)))

(declare-fun res!210866 () Bool)

(assert (=> b!374043 (=> (not res!210866) (not e!227975))))

(assert (=> b!374043 (= res!210866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172237 mask!970))))

(assert (=> b!374043 (= lt!172237 (array!21719 (store (arr!10327 _keys!658) i!548 k0!778) (size!10679 _keys!658)))))

(declare-fun b!374044 () Bool)

(declare-fun res!210862 () Bool)

(assert (=> b!374044 (=> (not res!210862) (not e!227981))))

(assert (=> b!374044 (= res!210862 (and (= (size!10680 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10679 _keys!658) (size!10680 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14913 () Bool)

(assert (=> mapIsEmpty!14913 mapRes!14913))

(declare-fun b!374045 () Bool)

(declare-fun e!227980 () Bool)

(declare-fun e!227976 () Bool)

(assert (=> b!374045 (= e!227980 (and e!227976 mapRes!14913))))

(declare-fun condMapEmpty!14913 () Bool)

(declare-fun mapDefault!14913 () ValueCell!4106)

(assert (=> b!374045 (= condMapEmpty!14913 (= (arr!10328 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4106)) mapDefault!14913)))))

(declare-fun b!374046 () Bool)

(declare-fun tp_is_empty!8899 () Bool)

(assert (=> b!374046 (= e!227982 tp_is_empty!8899)))

(declare-fun b!374047 () Bool)

(assert (=> b!374047 (= e!227976 tp_is_empty!8899)))

(declare-fun res!210865 () Bool)

(assert (=> start!37110 (=> (not res!210865) (not e!227981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37110 (= res!210865 (validMask!0 mask!970))))

(assert (=> start!37110 e!227981))

(declare-fun array_inv!7664 (array!21720) Bool)

(assert (=> start!37110 (and (array_inv!7664 _values!506) e!227980)))

(assert (=> start!37110 tp!29468))

(assert (=> start!37110 true))

(assert (=> start!37110 tp_is_empty!8899))

(declare-fun array_inv!7665 (array!21718) Bool)

(assert (=> start!37110 (array_inv!7665 _keys!658)))

(declare-fun b!374037 () Bool)

(assert (=> b!374037 (= e!227977 e!227979)))

(declare-fun res!210858 () Bool)

(assert (=> b!374037 (=> res!210858 e!227979)))

(assert (=> b!374037 (= res!210858 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172228 () ListLongMap!4789)

(assert (=> b!374037 (= lt!172228 lt!172229)))

(assert (=> b!374037 (= lt!172229 (+!806 lt!172226 lt!172240))))

(declare-fun lt!172224 () Unit!11501)

(assert (=> b!374037 (= lt!172224 (addCommutativeForDiffKeys!234 lt!172231 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374037 (= lt!172238 (+!806 lt!172228 lt!172239))))

(declare-fun lt!172230 () tuple2!5874)

(assert (=> b!374037 (= lt!172228 (+!806 lt!172225 lt!172230))))

(assert (=> b!374037 (= lt!172234 lt!172227)))

(assert (=> b!374037 (= lt!172227 (+!806 lt!172226 lt!172239))))

(assert (=> b!374037 (= lt!172226 (+!806 lt!172231 lt!172230))))

(assert (=> b!374037 (= lt!172238 (+!806 (+!806 lt!172235 lt!172230) lt!172239))))

(assert (=> b!374037 (= lt!172239 (tuple2!5875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374037 (= lt!172230 (tuple2!5875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37110 res!210865) b!374044))

(assert (= (and b!374044 res!210862) b!374039))

(assert (= (and b!374039 res!210864) b!374033))

(assert (= (and b!374033 res!210857) b!374042))

(assert (= (and b!374042 res!210863) b!374036))

(assert (= (and b!374036 res!210856) b!374035))

(assert (= (and b!374035 res!210855) b!374041))

(assert (= (and b!374041 res!210859) b!374043))

(assert (= (and b!374043 res!210866) b!374040))

(assert (= (and b!374040 res!210860) b!374038))

(assert (= (and b!374038 (not res!210861)) b!374037))

(assert (= (and b!374037 (not res!210858)) b!374034))

(assert (= (and b!374045 condMapEmpty!14913) mapIsEmpty!14913))

(assert (= (and b!374045 (not condMapEmpty!14913)) mapNonEmpty!14913))

(get-info :version)

(assert (= (and mapNonEmpty!14913 ((_ is ValueCellFull!4106) mapValue!14913)) b!374046))

(assert (= (and b!374045 ((_ is ValueCellFull!4106) mapDefault!14913)) b!374047))

(assert (= start!37110 b!374045))

(declare-fun m!370445 () Bool)

(assert (=> b!374041 m!370445))

(declare-fun m!370447 () Bool)

(assert (=> b!374040 m!370447))

(declare-fun m!370449 () Bool)

(assert (=> b!374039 m!370449))

(declare-fun m!370451 () Bool)

(assert (=> b!374043 m!370451))

(declare-fun m!370453 () Bool)

(assert (=> b!374043 m!370453))

(declare-fun m!370455 () Bool)

(assert (=> b!374034 m!370455))

(declare-fun m!370457 () Bool)

(assert (=> b!374034 m!370457))

(declare-fun m!370459 () Bool)

(assert (=> b!374034 m!370459))

(declare-fun m!370461 () Bool)

(assert (=> b!374035 m!370461))

(declare-fun m!370463 () Bool)

(assert (=> b!374037 m!370463))

(declare-fun m!370465 () Bool)

(assert (=> b!374037 m!370465))

(declare-fun m!370467 () Bool)

(assert (=> b!374037 m!370467))

(declare-fun m!370469 () Bool)

(assert (=> b!374037 m!370469))

(declare-fun m!370471 () Bool)

(assert (=> b!374037 m!370471))

(declare-fun m!370473 () Bool)

(assert (=> b!374037 m!370473))

(declare-fun m!370475 () Bool)

(assert (=> b!374037 m!370475))

(assert (=> b!374037 m!370475))

(declare-fun m!370477 () Bool)

(assert (=> b!374037 m!370477))

(declare-fun m!370479 () Bool)

(assert (=> b!374033 m!370479))

(declare-fun m!370481 () Bool)

(assert (=> start!37110 m!370481))

(declare-fun m!370483 () Bool)

(assert (=> start!37110 m!370483))

(declare-fun m!370485 () Bool)

(assert (=> start!37110 m!370485))

(declare-fun m!370487 () Bool)

(assert (=> b!374036 m!370487))

(declare-fun m!370489 () Bool)

(assert (=> b!374038 m!370489))

(declare-fun m!370491 () Bool)

(assert (=> b!374038 m!370491))

(declare-fun m!370493 () Bool)

(assert (=> b!374038 m!370493))

(declare-fun m!370495 () Bool)

(assert (=> b!374038 m!370495))

(declare-fun m!370497 () Bool)

(assert (=> b!374038 m!370497))

(declare-fun m!370499 () Bool)

(assert (=> b!374038 m!370499))

(declare-fun m!370501 () Bool)

(assert (=> b!374038 m!370501))

(declare-fun m!370503 () Bool)

(assert (=> mapNonEmpty!14913 m!370503))

(check-sat (not b_next!8251) (not b!374036) (not b!374034) tp_is_empty!8899 (not b!374040) (not mapNonEmpty!14913) (not b!374041) (not b!374037) b_and!15507 (not b!374038) (not b!374039) (not b!374043) (not start!37110) (not b!374033))
(check-sat b_and!15507 (not b_next!8251))
