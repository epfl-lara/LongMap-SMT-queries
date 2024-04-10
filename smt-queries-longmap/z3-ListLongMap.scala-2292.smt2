; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37216 () Bool)

(assert start!37216)

(declare-fun b_free!8343 () Bool)

(declare-fun b_next!8343 () Bool)

(assert (=> start!37216 (= b_free!8343 (not b_next!8343))))

(declare-fun tp!29745 () Bool)

(declare-fun b_and!15585 () Bool)

(assert (=> start!37216 (= tp!29745 b_and!15585)))

(declare-fun b!376161 () Bool)

(declare-fun res!212533 () Bool)

(declare-fun e!229118 () Bool)

(assert (=> b!376161 (=> (not res!212533) (not e!229118))))

(declare-datatypes ((array!21915 0))(
  ( (array!21916 (arr!10426 (Array (_ BitVec 32) (_ BitVec 64))) (size!10778 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21915)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21915 (_ BitVec 32)) Bool)

(assert (=> b!376161 (= res!212533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376162 () Bool)

(declare-fun res!212523 () Bool)

(declare-fun e!229117 () Bool)

(assert (=> b!376162 (=> (not res!212523) (not e!229117))))

(declare-fun lt!174390 () array!21915)

(declare-datatypes ((List!5886 0))(
  ( (Nil!5883) (Cons!5882 (h!6738 (_ BitVec 64)) (t!11036 List!5886)) )
))
(declare-fun arrayNoDuplicates!0 (array!21915 (_ BitVec 32) List!5886) Bool)

(assert (=> b!376162 (= res!212523 (arrayNoDuplicates!0 lt!174390 #b00000000000000000000000000000000 Nil!5883))))

(declare-fun b!376163 () Bool)

(declare-fun e!229111 () Bool)

(declare-fun tp_is_empty!8991 () Bool)

(assert (=> b!376163 (= e!229111 tp_is_empty!8991)))

(declare-fun b!376164 () Bool)

(declare-fun res!212532 () Bool)

(assert (=> b!376164 (=> (not res!212532) (not e!229118))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376164 (= res!212532 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10778 _keys!658))))))

(declare-fun b!376165 () Bool)

(declare-fun e!229112 () Bool)

(assert (=> b!376165 (= e!229112 true)))

(declare-datatypes ((V!13093 0))(
  ( (V!13094 (val!4540 Int)) )
))
(declare-datatypes ((tuple2!6044 0))(
  ( (tuple2!6045 (_1!3033 (_ BitVec 64)) (_2!3033 V!13093)) )
))
(declare-datatypes ((List!5887 0))(
  ( (Nil!5884) (Cons!5883 (h!6739 tuple2!6044) (t!11037 List!5887)) )
))
(declare-datatypes ((ListLongMap!4957 0))(
  ( (ListLongMap!4958 (toList!2494 List!5887)) )
))
(declare-fun lt!174387 () ListLongMap!4957)

(declare-fun lt!174391 () ListLongMap!4957)

(declare-fun lt!174399 () tuple2!6044)

(declare-fun +!840 (ListLongMap!4957 tuple2!6044) ListLongMap!4957)

(assert (=> b!376165 (= lt!174387 (+!840 lt!174391 lt!174399))))

(declare-fun lt!174393 () ListLongMap!4957)

(declare-fun v!373 () V!13093)

(declare-datatypes ((Unit!11586 0))(
  ( (Unit!11587) )
))
(declare-fun lt!174395 () Unit!11586)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13093)

(declare-fun addCommutativeForDiffKeys!255 (ListLongMap!4957 (_ BitVec 64) V!13093 (_ BitVec 64) V!13093) Unit!11586)

(assert (=> b!376165 (= lt!174395 (addCommutativeForDiffKeys!255 lt!174393 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376166 () Bool)

(declare-fun res!212527 () Bool)

(assert (=> b!376166 (=> (not res!212527) (not e!229118))))

(assert (=> b!376166 (= res!212527 (or (= (select (arr!10426 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10426 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15051 () Bool)

(declare-fun mapRes!15051 () Bool)

(declare-fun tp!29744 () Bool)

(assert (=> mapNonEmpty!15051 (= mapRes!15051 (and tp!29744 e!229111))))

(declare-datatypes ((ValueCell!4152 0))(
  ( (ValueCellFull!4152 (v!6737 V!13093)) (EmptyCell!4152) )
))
(declare-fun mapValue!15051 () ValueCell!4152)

(declare-datatypes ((array!21917 0))(
  ( (array!21918 (arr!10427 (Array (_ BitVec 32) ValueCell!4152)) (size!10779 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21917)

(declare-fun mapKey!15051 () (_ BitVec 32))

(declare-fun mapRest!15051 () (Array (_ BitVec 32) ValueCell!4152))

(assert (=> mapNonEmpty!15051 (= (arr!10427 _values!506) (store mapRest!15051 mapKey!15051 mapValue!15051))))

(declare-fun b!376167 () Bool)

(assert (=> b!376167 (= e!229118 e!229117)))

(declare-fun res!212524 () Bool)

(assert (=> b!376167 (=> (not res!212524) (not e!229117))))

(assert (=> b!376167 (= res!212524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174390 mask!970))))

(assert (=> b!376167 (= lt!174390 (array!21916 (store (arr!10426 _keys!658) i!548 k0!778) (size!10778 _keys!658)))))

(declare-fun b!376168 () Bool)

(declare-fun res!212529 () Bool)

(assert (=> b!376168 (=> (not res!212529) (not e!229118))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376168 (= res!212529 (and (= (size!10779 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10778 _keys!658) (size!10779 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376169 () Bool)

(declare-fun e!229114 () Bool)

(assert (=> b!376169 (= e!229114 e!229112)))

(declare-fun res!212525 () Bool)

(assert (=> b!376169 (=> res!212525 e!229112)))

(assert (=> b!376169 (= res!212525 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174396 () ListLongMap!4957)

(assert (=> b!376169 (= lt!174396 lt!174387)))

(declare-fun lt!174392 () ListLongMap!4957)

(declare-fun lt!174389 () tuple2!6044)

(assert (=> b!376169 (= lt!174387 (+!840 lt!174392 lt!174389))))

(declare-fun lt!174388 () ListLongMap!4957)

(assert (=> b!376169 (= lt!174388 lt!174391)))

(assert (=> b!376169 (= lt!174391 (+!840 lt!174393 lt!174389))))

(declare-fun lt!174397 () ListLongMap!4957)

(assert (=> b!376169 (= lt!174396 (+!840 lt!174397 lt!174389))))

(assert (=> b!376169 (= lt!174389 (tuple2!6045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212528 () Bool)

(assert (=> start!37216 (=> (not res!212528) (not e!229118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37216 (= res!212528 (validMask!0 mask!970))))

(assert (=> start!37216 e!229118))

(declare-fun e!229113 () Bool)

(declare-fun array_inv!7684 (array!21917) Bool)

(assert (=> start!37216 (and (array_inv!7684 _values!506) e!229113)))

(assert (=> start!37216 tp!29745))

(assert (=> start!37216 true))

(assert (=> start!37216 tp_is_empty!8991))

(declare-fun array_inv!7685 (array!21915) Bool)

(assert (=> start!37216 (array_inv!7685 _keys!658)))

(declare-fun b!376170 () Bool)

(assert (=> b!376170 (= e!229117 (not e!229114))))

(declare-fun res!212531 () Bool)

(assert (=> b!376170 (=> res!212531 e!229114)))

(assert (=> b!376170 (= res!212531 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13093)

(declare-fun getCurrentListMap!1928 (array!21915 array!21917 (_ BitVec 32) (_ BitVec 32) V!13093 V!13093 (_ BitVec 32) Int) ListLongMap!4957)

(assert (=> b!376170 (= lt!174388 (getCurrentListMap!1928 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174398 () array!21917)

(assert (=> b!376170 (= lt!174396 (getCurrentListMap!1928 lt!174390 lt!174398 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376170 (and (= lt!174397 lt!174392) (= lt!174392 lt!174397))))

(assert (=> b!376170 (= lt!174392 (+!840 lt!174393 lt!174399))))

(assert (=> b!376170 (= lt!174399 (tuple2!6045 k0!778 v!373))))

(declare-fun lt!174394 () Unit!11586)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!86 (array!21915 array!21917 (_ BitVec 32) (_ BitVec 32) V!13093 V!13093 (_ BitVec 32) (_ BitVec 64) V!13093 (_ BitVec 32) Int) Unit!11586)

(assert (=> b!376170 (= lt!174394 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!86 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!762 (array!21915 array!21917 (_ BitVec 32) (_ BitVec 32) V!13093 V!13093 (_ BitVec 32) Int) ListLongMap!4957)

(assert (=> b!376170 (= lt!174397 (getCurrentListMapNoExtraKeys!762 lt!174390 lt!174398 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376170 (= lt!174398 (array!21918 (store (arr!10427 _values!506) i!548 (ValueCellFull!4152 v!373)) (size!10779 _values!506)))))

(assert (=> b!376170 (= lt!174393 (getCurrentListMapNoExtraKeys!762 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376171 () Bool)

(declare-fun res!212530 () Bool)

(assert (=> b!376171 (=> (not res!212530) (not e!229118))))

(assert (=> b!376171 (= res!212530 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5883))))

(declare-fun b!376172 () Bool)

(declare-fun res!212526 () Bool)

(assert (=> b!376172 (=> (not res!212526) (not e!229118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376172 (= res!212526 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15051 () Bool)

(assert (=> mapIsEmpty!15051 mapRes!15051))

(declare-fun b!376173 () Bool)

(declare-fun e!229115 () Bool)

(assert (=> b!376173 (= e!229115 tp_is_empty!8991)))

(declare-fun b!376174 () Bool)

(assert (=> b!376174 (= e!229113 (and e!229115 mapRes!15051))))

(declare-fun condMapEmpty!15051 () Bool)

(declare-fun mapDefault!15051 () ValueCell!4152)

(assert (=> b!376174 (= condMapEmpty!15051 (= (arr!10427 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4152)) mapDefault!15051)))))

(declare-fun b!376175 () Bool)

(declare-fun res!212534 () Bool)

(assert (=> b!376175 (=> (not res!212534) (not e!229118))))

(declare-fun arrayContainsKey!0 (array!21915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376175 (= res!212534 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37216 res!212528) b!376168))

(assert (= (and b!376168 res!212529) b!376161))

(assert (= (and b!376161 res!212533) b!376171))

(assert (= (and b!376171 res!212530) b!376164))

(assert (= (and b!376164 res!212532) b!376172))

(assert (= (and b!376172 res!212526) b!376166))

(assert (= (and b!376166 res!212527) b!376175))

(assert (= (and b!376175 res!212534) b!376167))

(assert (= (and b!376167 res!212524) b!376162))

(assert (= (and b!376162 res!212523) b!376170))

(assert (= (and b!376170 (not res!212531)) b!376169))

(assert (= (and b!376169 (not res!212525)) b!376165))

(assert (= (and b!376174 condMapEmpty!15051) mapIsEmpty!15051))

(assert (= (and b!376174 (not condMapEmpty!15051)) mapNonEmpty!15051))

(get-info :version)

(assert (= (and mapNonEmpty!15051 ((_ is ValueCellFull!4152) mapValue!15051)) b!376163))

(assert (= (and b!376174 ((_ is ValueCellFull!4152) mapDefault!15051)) b!376173))

(assert (= start!37216 b!376174))

(declare-fun m!372843 () Bool)

(assert (=> b!376162 m!372843))

(declare-fun m!372845 () Bool)

(assert (=> start!37216 m!372845))

(declare-fun m!372847 () Bool)

(assert (=> start!37216 m!372847))

(declare-fun m!372849 () Bool)

(assert (=> start!37216 m!372849))

(declare-fun m!372851 () Bool)

(assert (=> b!376166 m!372851))

(declare-fun m!372853 () Bool)

(assert (=> b!376161 m!372853))

(declare-fun m!372855 () Bool)

(assert (=> b!376175 m!372855))

(declare-fun m!372857 () Bool)

(assert (=> b!376171 m!372857))

(declare-fun m!372859 () Bool)

(assert (=> b!376170 m!372859))

(declare-fun m!372861 () Bool)

(assert (=> b!376170 m!372861))

(declare-fun m!372863 () Bool)

(assert (=> b!376170 m!372863))

(declare-fun m!372865 () Bool)

(assert (=> b!376170 m!372865))

(declare-fun m!372867 () Bool)

(assert (=> b!376170 m!372867))

(declare-fun m!372869 () Bool)

(assert (=> b!376170 m!372869))

(declare-fun m!372871 () Bool)

(assert (=> b!376170 m!372871))

(declare-fun m!372873 () Bool)

(assert (=> mapNonEmpty!15051 m!372873))

(declare-fun m!372875 () Bool)

(assert (=> b!376167 m!372875))

(declare-fun m!372877 () Bool)

(assert (=> b!376167 m!372877))

(declare-fun m!372879 () Bool)

(assert (=> b!376165 m!372879))

(declare-fun m!372881 () Bool)

(assert (=> b!376165 m!372881))

(declare-fun m!372883 () Bool)

(assert (=> b!376169 m!372883))

(declare-fun m!372885 () Bool)

(assert (=> b!376169 m!372885))

(declare-fun m!372887 () Bool)

(assert (=> b!376169 m!372887))

(declare-fun m!372889 () Bool)

(assert (=> b!376172 m!372889))

(check-sat (not b!376171) (not b!376172) (not mapNonEmpty!15051) (not b!376161) b_and!15585 (not b_next!8343) (not b!376162) (not b!376170) (not b!376165) (not b!376167) tp_is_empty!8991 (not b!376169) (not start!37216) (not b!376175))
(check-sat b_and!15585 (not b_next!8343))
