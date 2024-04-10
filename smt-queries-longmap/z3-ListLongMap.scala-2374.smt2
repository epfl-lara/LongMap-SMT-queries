; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37708 () Bool)

(assert start!37708)

(declare-fun b_free!8811 () Bool)

(declare-fun b_next!8811 () Bool)

(assert (=> start!37708 (= b_free!8811 (not b_next!8811))))

(declare-fun tp!31184 () Bool)

(declare-fun b_and!16053 () Bool)

(assert (=> start!37708 (= tp!31184 b_and!16053)))

(declare-fun b!386519 () Bool)

(declare-fun res!220667 () Bool)

(declare-fun e!234469 () Bool)

(assert (=> b!386519 (=> (not res!220667) (not e!234469))))

(declare-datatypes ((array!22861 0))(
  ( (array!22862 (arr!10899 (Array (_ BitVec 32) (_ BitVec 64))) (size!11251 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22861)

(declare-datatypes ((List!6281 0))(
  ( (Nil!6278) (Cons!6277 (h!7133 (_ BitVec 64)) (t!11431 List!6281)) )
))
(declare-fun arrayNoDuplicates!0 (array!22861 (_ BitVec 32) List!6281) Bool)

(assert (=> b!386519 (= res!220667 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6278))))

(declare-fun b!386520 () Bool)

(declare-fun res!220673 () Bool)

(assert (=> b!386520 (=> (not res!220673) (not e!234469))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386520 (= res!220673 (or (= (select (arr!10899 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10899 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386521 () Bool)

(declare-fun res!220672 () Bool)

(assert (=> b!386521 (=> (not res!220672) (not e!234469))))

(assert (=> b!386521 (= res!220672 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11251 _keys!658))))))

(declare-fun b!386522 () Bool)

(declare-fun e!234465 () Bool)

(declare-fun tp_is_empty!9483 () Bool)

(assert (=> b!386522 (= e!234465 tp_is_empty!9483)))

(declare-fun b!386523 () Bool)

(declare-fun e!234470 () Bool)

(assert (=> b!386523 (= e!234470 false)))

(declare-datatypes ((V!13749 0))(
  ( (V!13750 (val!4786 Int)) )
))
(declare-datatypes ((ValueCell!4398 0))(
  ( (ValueCellFull!4398 (v!6983 V!13749)) (EmptyCell!4398) )
))
(declare-datatypes ((array!22863 0))(
  ( (array!22864 (arr!10900 (Array (_ BitVec 32) ValueCell!4398)) (size!11252 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22863)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13749)

(declare-fun lt!181826 () array!22861)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((tuple2!6434 0))(
  ( (tuple2!6435 (_1!3228 (_ BitVec 64)) (_2!3228 V!13749)) )
))
(declare-datatypes ((List!6282 0))(
  ( (Nil!6279) (Cons!6278 (h!7134 tuple2!6434) (t!11432 List!6282)) )
))
(declare-datatypes ((ListLongMap!5347 0))(
  ( (ListLongMap!5348 (toList!2689 List!6282)) )
))
(declare-fun lt!181827 () ListLongMap!5347)

(declare-fun v!373 () V!13749)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13749)

(declare-fun getCurrentListMapNoExtraKeys!918 (array!22861 array!22863 (_ BitVec 32) (_ BitVec 32) V!13749 V!13749 (_ BitVec 32) Int) ListLongMap!5347)

(assert (=> b!386523 (= lt!181827 (getCurrentListMapNoExtraKeys!918 lt!181826 (array!22864 (store (arr!10900 _values!506) i!548 (ValueCellFull!4398 v!373)) (size!11252 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181825 () ListLongMap!5347)

(assert (=> b!386523 (= lt!181825 (getCurrentListMapNoExtraKeys!918 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!220675 () Bool)

(assert (=> start!37708 (=> (not res!220675) (not e!234469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37708 (= res!220675 (validMask!0 mask!970))))

(assert (=> start!37708 e!234469))

(declare-fun e!234467 () Bool)

(declare-fun array_inv!8018 (array!22863) Bool)

(assert (=> start!37708 (and (array_inv!8018 _values!506) e!234467)))

(assert (=> start!37708 tp!31184))

(assert (=> start!37708 true))

(assert (=> start!37708 tp_is_empty!9483))

(declare-fun array_inv!8019 (array!22861) Bool)

(assert (=> start!37708 (array_inv!8019 _keys!658)))

(declare-fun mapNonEmpty!15789 () Bool)

(declare-fun mapRes!15789 () Bool)

(declare-fun tp!31185 () Bool)

(declare-fun e!234468 () Bool)

(assert (=> mapNonEmpty!15789 (= mapRes!15789 (and tp!31185 e!234468))))

(declare-fun mapValue!15789 () ValueCell!4398)

(declare-fun mapRest!15789 () (Array (_ BitVec 32) ValueCell!4398))

(declare-fun mapKey!15789 () (_ BitVec 32))

(assert (=> mapNonEmpty!15789 (= (arr!10900 _values!506) (store mapRest!15789 mapKey!15789 mapValue!15789))))

(declare-fun b!386524 () Bool)

(declare-fun res!220670 () Bool)

(assert (=> b!386524 (=> (not res!220670) (not e!234469))))

(assert (=> b!386524 (= res!220670 (and (= (size!11252 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11251 _keys!658) (size!11252 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386525 () Bool)

(declare-fun res!220668 () Bool)

(assert (=> b!386525 (=> (not res!220668) (not e!234469))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386525 (= res!220668 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386526 () Bool)

(assert (=> b!386526 (= e!234468 tp_is_empty!9483)))

(declare-fun b!386527 () Bool)

(assert (=> b!386527 (= e!234469 e!234470)))

(declare-fun res!220669 () Bool)

(assert (=> b!386527 (=> (not res!220669) (not e!234470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22861 (_ BitVec 32)) Bool)

(assert (=> b!386527 (= res!220669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181826 mask!970))))

(assert (=> b!386527 (= lt!181826 (array!22862 (store (arr!10899 _keys!658) i!548 k0!778) (size!11251 _keys!658)))))

(declare-fun mapIsEmpty!15789 () Bool)

(assert (=> mapIsEmpty!15789 mapRes!15789))

(declare-fun b!386528 () Bool)

(assert (=> b!386528 (= e!234467 (and e!234465 mapRes!15789))))

(declare-fun condMapEmpty!15789 () Bool)

(declare-fun mapDefault!15789 () ValueCell!4398)

(assert (=> b!386528 (= condMapEmpty!15789 (= (arr!10900 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4398)) mapDefault!15789)))))

(declare-fun b!386529 () Bool)

(declare-fun res!220671 () Bool)

(assert (=> b!386529 (=> (not res!220671) (not e!234470))))

(assert (=> b!386529 (= res!220671 (arrayNoDuplicates!0 lt!181826 #b00000000000000000000000000000000 Nil!6278))))

(declare-fun b!386530 () Bool)

(declare-fun res!220674 () Bool)

(assert (=> b!386530 (=> (not res!220674) (not e!234469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386530 (= res!220674 (validKeyInArray!0 k0!778))))

(declare-fun b!386531 () Bool)

(declare-fun res!220676 () Bool)

(assert (=> b!386531 (=> (not res!220676) (not e!234469))))

(assert (=> b!386531 (= res!220676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37708 res!220675) b!386524))

(assert (= (and b!386524 res!220670) b!386531))

(assert (= (and b!386531 res!220676) b!386519))

(assert (= (and b!386519 res!220667) b!386521))

(assert (= (and b!386521 res!220672) b!386530))

(assert (= (and b!386530 res!220674) b!386520))

(assert (= (and b!386520 res!220673) b!386525))

(assert (= (and b!386525 res!220668) b!386527))

(assert (= (and b!386527 res!220669) b!386529))

(assert (= (and b!386529 res!220671) b!386523))

(assert (= (and b!386528 condMapEmpty!15789) mapIsEmpty!15789))

(assert (= (and b!386528 (not condMapEmpty!15789)) mapNonEmpty!15789))

(get-info :version)

(assert (= (and mapNonEmpty!15789 ((_ is ValueCellFull!4398) mapValue!15789)) b!386526))

(assert (= (and b!386528 ((_ is ValueCellFull!4398) mapDefault!15789)) b!386522))

(assert (= start!37708 b!386528))

(declare-fun m!382845 () Bool)

(assert (=> b!386520 m!382845))

(declare-fun m!382847 () Bool)

(assert (=> b!386519 m!382847))

(declare-fun m!382849 () Bool)

(assert (=> b!386525 m!382849))

(declare-fun m!382851 () Bool)

(assert (=> mapNonEmpty!15789 m!382851))

(declare-fun m!382853 () Bool)

(assert (=> b!386523 m!382853))

(declare-fun m!382855 () Bool)

(assert (=> b!386523 m!382855))

(declare-fun m!382857 () Bool)

(assert (=> b!386523 m!382857))

(declare-fun m!382859 () Bool)

(assert (=> b!386529 m!382859))

(declare-fun m!382861 () Bool)

(assert (=> b!386531 m!382861))

(declare-fun m!382863 () Bool)

(assert (=> b!386527 m!382863))

(declare-fun m!382865 () Bool)

(assert (=> b!386527 m!382865))

(declare-fun m!382867 () Bool)

(assert (=> b!386530 m!382867))

(declare-fun m!382869 () Bool)

(assert (=> start!37708 m!382869))

(declare-fun m!382871 () Bool)

(assert (=> start!37708 m!382871))

(declare-fun m!382873 () Bool)

(assert (=> start!37708 m!382873))

(check-sat (not start!37708) tp_is_empty!9483 b_and!16053 (not b!386529) (not mapNonEmpty!15789) (not b!386530) (not b!386523) (not b!386525) (not b!386531) (not b!386519) (not b!386527) (not b_next!8811))
(check-sat b_and!16053 (not b_next!8811))
