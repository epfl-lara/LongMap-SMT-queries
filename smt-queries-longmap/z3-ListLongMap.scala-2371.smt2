; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37674 () Bool)

(assert start!37674)

(declare-fun b_free!8791 () Bool)

(declare-fun b_next!8791 () Bool)

(assert (=> start!37674 (= b_free!8791 (not b_next!8791))))

(declare-fun tp!31125 () Bool)

(declare-fun b_and!16007 () Bool)

(assert (=> start!37674 (= tp!31125 b_and!16007)))

(declare-fun res!220247 () Bool)

(declare-fun e!234111 () Bool)

(assert (=> start!37674 (=> (not res!220247) (not e!234111))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37674 (= res!220247 (validMask!0 mask!970))))

(assert (=> start!37674 e!234111))

(declare-datatypes ((V!13723 0))(
  ( (V!13724 (val!4776 Int)) )
))
(declare-datatypes ((ValueCell!4388 0))(
  ( (ValueCellFull!4388 (v!6967 V!13723)) (EmptyCell!4388) )
))
(declare-datatypes ((array!22809 0))(
  ( (array!22810 (arr!10873 (Array (_ BitVec 32) ValueCell!4388)) (size!11226 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22809)

(declare-fun e!234112 () Bool)

(declare-fun array_inv!8002 (array!22809) Bool)

(assert (=> start!37674 (and (array_inv!8002 _values!506) e!234112)))

(assert (=> start!37674 tp!31125))

(assert (=> start!37674 true))

(declare-fun tp_is_empty!9463 () Bool)

(assert (=> start!37674 tp_is_empty!9463))

(declare-datatypes ((array!22811 0))(
  ( (array!22812 (arr!10874 (Array (_ BitVec 32) (_ BitVec 64))) (size!11227 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22811)

(declare-fun array_inv!8003 (array!22811) Bool)

(assert (=> start!37674 (array_inv!8003 _keys!658)))

(declare-fun b!385858 () Bool)

(declare-fun res!220241 () Bool)

(assert (=> b!385858 (=> (not res!220241) (not e!234111))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385858 (= res!220241 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15759 () Bool)

(declare-fun mapRes!15759 () Bool)

(declare-fun tp!31124 () Bool)

(declare-fun e!234113 () Bool)

(assert (=> mapNonEmpty!15759 (= mapRes!15759 (and tp!31124 e!234113))))

(declare-fun mapValue!15759 () ValueCell!4388)

(declare-fun mapKey!15759 () (_ BitVec 32))

(declare-fun mapRest!15759 () (Array (_ BitVec 32) ValueCell!4388))

(assert (=> mapNonEmpty!15759 (= (arr!10873 _values!506) (store mapRest!15759 mapKey!15759 mapValue!15759))))

(declare-fun b!385859 () Bool)

(declare-fun res!220242 () Bool)

(assert (=> b!385859 (=> (not res!220242) (not e!234111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385859 (= res!220242 (validKeyInArray!0 k0!778))))

(declare-fun b!385860 () Bool)

(declare-fun e!234116 () Bool)

(assert (=> b!385860 (= e!234112 (and e!234116 mapRes!15759))))

(declare-fun condMapEmpty!15759 () Bool)

(declare-fun mapDefault!15759 () ValueCell!4388)

(assert (=> b!385860 (= condMapEmpty!15759 (= (arr!10873 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4388)) mapDefault!15759)))))

(declare-fun b!385861 () Bool)

(declare-fun res!220240 () Bool)

(assert (=> b!385861 (=> (not res!220240) (not e!234111))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385861 (= res!220240 (or (= (select (arr!10874 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10874 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385862 () Bool)

(assert (=> b!385862 (= e!234116 tp_is_empty!9463)))

(declare-fun b!385863 () Bool)

(declare-fun res!220246 () Bool)

(assert (=> b!385863 (=> (not res!220246) (not e!234111))))

(declare-datatypes ((List!6237 0))(
  ( (Nil!6234) (Cons!6233 (h!7089 (_ BitVec 64)) (t!11378 List!6237)) )
))
(declare-fun arrayNoDuplicates!0 (array!22811 (_ BitVec 32) List!6237) Bool)

(assert (=> b!385863 (= res!220246 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6234))))

(declare-fun b!385864 () Bool)

(declare-fun e!234115 () Bool)

(assert (=> b!385864 (= e!234111 e!234115)))

(declare-fun res!220245 () Bool)

(assert (=> b!385864 (=> (not res!220245) (not e!234115))))

(declare-fun lt!181501 () array!22811)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22811 (_ BitVec 32)) Bool)

(assert (=> b!385864 (= res!220245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181501 mask!970))))

(assert (=> b!385864 (= lt!181501 (array!22812 (store (arr!10874 _keys!658) i!548 k0!778) (size!11227 _keys!658)))))

(declare-fun b!385865 () Bool)

(declare-fun res!220243 () Bool)

(assert (=> b!385865 (=> (not res!220243) (not e!234115))))

(assert (=> b!385865 (= res!220243 (arrayNoDuplicates!0 lt!181501 #b00000000000000000000000000000000 Nil!6234))))

(declare-fun b!385866 () Bool)

(declare-fun res!220238 () Bool)

(assert (=> b!385866 (=> (not res!220238) (not e!234111))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385866 (= res!220238 (and (= (size!11226 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11227 _keys!658) (size!11226 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385867 () Bool)

(assert (=> b!385867 (= e!234113 tp_is_empty!9463)))

(declare-fun b!385868 () Bool)

(declare-fun res!220244 () Bool)

(assert (=> b!385868 (=> (not res!220244) (not e!234111))))

(assert (=> b!385868 (= res!220244 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11227 _keys!658))))))

(declare-fun b!385869 () Bool)

(declare-fun res!220239 () Bool)

(assert (=> b!385869 (=> (not res!220239) (not e!234111))))

(assert (=> b!385869 (= res!220239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385870 () Bool)

(assert (=> b!385870 (= e!234115 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6406 0))(
  ( (tuple2!6407 (_1!3214 (_ BitVec 64)) (_2!3214 V!13723)) )
))
(declare-datatypes ((List!6238 0))(
  ( (Nil!6235) (Cons!6234 (h!7090 tuple2!6406) (t!11379 List!6238)) )
))
(declare-datatypes ((ListLongMap!5309 0))(
  ( (ListLongMap!5310 (toList!2670 List!6238)) )
))
(declare-fun lt!181503 () ListLongMap!5309)

(declare-fun v!373 () V!13723)

(declare-fun zeroValue!472 () V!13723)

(declare-fun minValue!472 () V!13723)

(declare-fun getCurrentListMapNoExtraKeys!910 (array!22811 array!22809 (_ BitVec 32) (_ BitVec 32) V!13723 V!13723 (_ BitVec 32) Int) ListLongMap!5309)

(assert (=> b!385870 (= lt!181503 (getCurrentListMapNoExtraKeys!910 lt!181501 (array!22810 (store (arr!10873 _values!506) i!548 (ValueCellFull!4388 v!373)) (size!11226 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181502 () ListLongMap!5309)

(assert (=> b!385870 (= lt!181502 (getCurrentListMapNoExtraKeys!910 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15759 () Bool)

(assert (=> mapIsEmpty!15759 mapRes!15759))

(assert (= (and start!37674 res!220247) b!385866))

(assert (= (and b!385866 res!220238) b!385869))

(assert (= (and b!385869 res!220239) b!385863))

(assert (= (and b!385863 res!220246) b!385868))

(assert (= (and b!385868 res!220244) b!385859))

(assert (= (and b!385859 res!220242) b!385861))

(assert (= (and b!385861 res!220240) b!385858))

(assert (= (and b!385858 res!220241) b!385864))

(assert (= (and b!385864 res!220245) b!385865))

(assert (= (and b!385865 res!220243) b!385870))

(assert (= (and b!385860 condMapEmpty!15759) mapIsEmpty!15759))

(assert (= (and b!385860 (not condMapEmpty!15759)) mapNonEmpty!15759))

(get-info :version)

(assert (= (and mapNonEmpty!15759 ((_ is ValueCellFull!4388) mapValue!15759)) b!385867))

(assert (= (and b!385860 ((_ is ValueCellFull!4388) mapDefault!15759)) b!385862))

(assert (= start!37674 b!385860))

(declare-fun m!381821 () Bool)

(assert (=> b!385864 m!381821))

(declare-fun m!381823 () Bool)

(assert (=> b!385864 m!381823))

(declare-fun m!381825 () Bool)

(assert (=> mapNonEmpty!15759 m!381825))

(declare-fun m!381827 () Bool)

(assert (=> b!385858 m!381827))

(declare-fun m!381829 () Bool)

(assert (=> b!385870 m!381829))

(declare-fun m!381831 () Bool)

(assert (=> b!385870 m!381831))

(declare-fun m!381833 () Bool)

(assert (=> b!385870 m!381833))

(declare-fun m!381835 () Bool)

(assert (=> b!385869 m!381835))

(declare-fun m!381837 () Bool)

(assert (=> b!385859 m!381837))

(declare-fun m!381839 () Bool)

(assert (=> b!385865 m!381839))

(declare-fun m!381841 () Bool)

(assert (=> start!37674 m!381841))

(declare-fun m!381843 () Bool)

(assert (=> start!37674 m!381843))

(declare-fun m!381845 () Bool)

(assert (=> start!37674 m!381845))

(declare-fun m!381847 () Bool)

(assert (=> b!385861 m!381847))

(declare-fun m!381849 () Bool)

(assert (=> b!385863 m!381849))

(check-sat b_and!16007 (not mapNonEmpty!15759) (not b!385859) (not b!385863) (not b!385865) (not b!385869) (not b_next!8791) tp_is_empty!9463 (not b!385870) (not b!385864) (not start!37674) (not b!385858))
(check-sat b_and!16007 (not b_next!8791))
