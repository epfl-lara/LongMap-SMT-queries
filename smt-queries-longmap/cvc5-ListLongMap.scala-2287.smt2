; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37184 () Bool)

(assert start!37184)

(declare-fun b_free!8311 () Bool)

(declare-fun b_next!8311 () Bool)

(assert (=> start!37184 (= b_free!8311 (not b_next!8311))))

(declare-fun tp!29649 () Bool)

(declare-fun b_and!15553 () Bool)

(assert (=> start!37184 (= tp!29649 b_and!15553)))

(declare-fun b!375432 () Bool)

(declare-fun res!211946 () Bool)

(declare-fun e!228733 () Bool)

(assert (=> b!375432 (=> (not res!211946) (not e!228733))))

(declare-datatypes ((array!21853 0))(
  ( (array!21854 (arr!10395 (Array (_ BitVec 32) (_ BitVec 64))) (size!10747 (_ BitVec 32))) )
))
(declare-fun lt!173736 () array!21853)

(declare-datatypes ((List!5862 0))(
  ( (Nil!5859) (Cons!5858 (h!6714 (_ BitVec 64)) (t!11012 List!5862)) )
))
(declare-fun arrayNoDuplicates!0 (array!21853 (_ BitVec 32) List!5862) Bool)

(assert (=> b!375432 (= res!211946 (arrayNoDuplicates!0 lt!173736 #b00000000000000000000000000000000 Nil!5859))))

(declare-fun b!375433 () Bool)

(declare-fun e!228728 () Bool)

(declare-fun tp_is_empty!8959 () Bool)

(assert (=> b!375433 (= e!228728 tp_is_empty!8959)))

(declare-fun b!375434 () Bool)

(declare-fun e!228732 () Bool)

(assert (=> b!375434 (= e!228732 e!228733)))

(declare-fun res!211938 () Bool)

(assert (=> b!375434 (=> (not res!211938) (not e!228733))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21853 (_ BitVec 32)) Bool)

(assert (=> b!375434 (= res!211938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173736 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21853)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375434 (= lt!173736 (array!21854 (store (arr!10395 _keys!658) i!548 k!778) (size!10747 _keys!658)))))

(declare-fun res!211945 () Bool)

(assert (=> start!37184 (=> (not res!211945) (not e!228732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37184 (= res!211945 (validMask!0 mask!970))))

(assert (=> start!37184 e!228732))

(declare-datatypes ((V!13051 0))(
  ( (V!13052 (val!4524 Int)) )
))
(declare-datatypes ((ValueCell!4136 0))(
  ( (ValueCellFull!4136 (v!6721 V!13051)) (EmptyCell!4136) )
))
(declare-datatypes ((array!21855 0))(
  ( (array!21856 (arr!10396 (Array (_ BitVec 32) ValueCell!4136)) (size!10748 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21855)

(declare-fun e!228727 () Bool)

(declare-fun array_inv!7664 (array!21855) Bool)

(assert (=> start!37184 (and (array_inv!7664 _values!506) e!228727)))

(assert (=> start!37184 tp!29649))

(assert (=> start!37184 true))

(assert (=> start!37184 tp_is_empty!8959))

(declare-fun array_inv!7665 (array!21853) Bool)

(assert (=> start!37184 (array_inv!7665 _keys!658)))

(declare-fun b!375435 () Bool)

(declare-fun e!228731 () Bool)

(assert (=> b!375435 (= e!228733 (not e!228731))))

(declare-fun res!211941 () Bool)

(assert (=> b!375435 (=> res!211941 e!228731)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375435 (= res!211941 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13051)

(declare-datatypes ((tuple2!6020 0))(
  ( (tuple2!6021 (_1!3021 (_ BitVec 64)) (_2!3021 V!13051)) )
))
(declare-datatypes ((List!5863 0))(
  ( (Nil!5860) (Cons!5859 (h!6715 tuple2!6020) (t!11013 List!5863)) )
))
(declare-datatypes ((ListLongMap!4933 0))(
  ( (ListLongMap!4934 (toList!2482 List!5863)) )
))
(declare-fun lt!173744 () ListLongMap!4933)

(declare-fun minValue!472 () V!13051)

(declare-fun getCurrentListMap!1917 (array!21853 array!21855 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4933)

(assert (=> b!375435 (= lt!173744 (getCurrentListMap!1917 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173739 () ListLongMap!4933)

(declare-fun lt!173740 () array!21855)

(assert (=> b!375435 (= lt!173739 (getCurrentListMap!1917 lt!173736 lt!173740 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173735 () ListLongMap!4933)

(declare-fun lt!173741 () ListLongMap!4933)

(assert (=> b!375435 (and (= lt!173735 lt!173741) (= lt!173741 lt!173735))))

(declare-fun lt!173749 () ListLongMap!4933)

(declare-fun lt!173738 () tuple2!6020)

(declare-fun +!828 (ListLongMap!4933 tuple2!6020) ListLongMap!4933)

(assert (=> b!375435 (= lt!173741 (+!828 lt!173749 lt!173738))))

(declare-fun v!373 () V!13051)

(assert (=> b!375435 (= lt!173738 (tuple2!6021 k!778 v!373))))

(declare-datatypes ((Unit!11562 0))(
  ( (Unit!11563) )
))
(declare-fun lt!173751 () Unit!11562)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!75 (array!21853 array!21855 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) (_ BitVec 64) V!13051 (_ BitVec 32) Int) Unit!11562)

(assert (=> b!375435 (= lt!173751 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!75 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!751 (array!21853 array!21855 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4933)

(assert (=> b!375435 (= lt!173735 (getCurrentListMapNoExtraKeys!751 lt!173736 lt!173740 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375435 (= lt!173740 (array!21856 (store (arr!10396 _values!506) i!548 (ValueCellFull!4136 v!373)) (size!10748 _values!506)))))

(assert (=> b!375435 (= lt!173749 (getCurrentListMapNoExtraKeys!751 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15003 () Bool)

(declare-fun mapRes!15003 () Bool)

(declare-fun tp!29648 () Bool)

(declare-fun e!228730 () Bool)

(assert (=> mapNonEmpty!15003 (= mapRes!15003 (and tp!29648 e!228730))))

(declare-fun mapRest!15003 () (Array (_ BitVec 32) ValueCell!4136))

(declare-fun mapKey!15003 () (_ BitVec 32))

(declare-fun mapValue!15003 () ValueCell!4136)

(assert (=> mapNonEmpty!15003 (= (arr!10396 _values!506) (store mapRest!15003 mapKey!15003 mapValue!15003))))

(declare-fun b!375436 () Bool)

(assert (=> b!375436 (= e!228727 (and e!228728 mapRes!15003))))

(declare-fun condMapEmpty!15003 () Bool)

(declare-fun mapDefault!15003 () ValueCell!4136)

