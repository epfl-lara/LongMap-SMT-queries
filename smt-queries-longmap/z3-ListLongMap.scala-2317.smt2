; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37350 () Bool)

(assert start!37350)

(declare-fun b_free!8491 () Bool)

(declare-fun b_next!8491 () Bool)

(assert (=> start!37350 (= b_free!8491 (not b_next!8491))))

(declare-fun tp!30189 () Bool)

(declare-fun b_and!15747 () Bool)

(assert (=> start!37350 (= tp!30189 b_and!15747)))

(declare-fun mapNonEmpty!15273 () Bool)

(declare-fun mapRes!15273 () Bool)

(declare-fun tp!30188 () Bool)

(declare-fun e!230862 () Bool)

(assert (=> mapNonEmpty!15273 (= mapRes!15273 (and tp!30188 e!230862))))

(declare-datatypes ((V!13291 0))(
  ( (V!13292 (val!4614 Int)) )
))
(declare-datatypes ((ValueCell!4226 0))(
  ( (ValueCellFull!4226 (v!6812 V!13291)) (EmptyCell!4226) )
))
(declare-fun mapRest!15273 () (Array (_ BitVec 32) ValueCell!4226))

(declare-fun mapValue!15273 () ValueCell!4226)

(declare-datatypes ((array!22184 0))(
  ( (array!22185 (arr!10560 (Array (_ BitVec 32) ValueCell!4226)) (size!10912 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22184)

(declare-fun mapKey!15273 () (_ BitVec 32))

(assert (=> mapNonEmpty!15273 (= (arr!10560 _values!506) (store mapRest!15273 mapKey!15273 mapValue!15273))))

(declare-fun b!379451 () Bool)

(declare-fun e!230856 () Bool)

(declare-fun e!230855 () Bool)

(assert (=> b!379451 (= e!230856 (not e!230855))))

(declare-fun res!215204 () Bool)

(assert (=> b!379451 (=> res!215204 e!230855)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379451 (= res!215204 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6066 0))(
  ( (tuple2!6067 (_1!3044 (_ BitVec 64)) (_2!3044 V!13291)) )
))
(declare-datatypes ((List!5903 0))(
  ( (Nil!5900) (Cons!5899 (h!6755 tuple2!6066) (t!11045 List!5903)) )
))
(declare-datatypes ((ListLongMap!4981 0))(
  ( (ListLongMap!4982 (toList!2506 List!5903)) )
))
(declare-fun lt!177260 () ListLongMap!4981)

(declare-fun zeroValue!472 () V!13291)

(declare-datatypes ((array!22186 0))(
  ( (array!22187 (arr!10561 (Array (_ BitVec 32) (_ BitVec 64))) (size!10913 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22186)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13291)

(declare-fun getCurrentListMap!1946 (array!22186 array!22184 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!379451 (= lt!177260 (getCurrentListMap!1946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177262 () array!22184)

(declare-fun lt!177264 () array!22186)

(declare-fun lt!177265 () ListLongMap!4981)

(assert (=> b!379451 (= lt!177265 (getCurrentListMap!1946 lt!177264 lt!177262 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177258 () ListLongMap!4981)

(declare-fun lt!177259 () ListLongMap!4981)

(assert (=> b!379451 (and (= lt!177258 lt!177259) (= lt!177259 lt!177258))))

(declare-fun lt!177267 () ListLongMap!4981)

(declare-fun lt!177266 () tuple2!6066)

(declare-fun +!902 (ListLongMap!4981 tuple2!6066) ListLongMap!4981)

(assert (=> b!379451 (= lt!177259 (+!902 lt!177267 lt!177266))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13291)

(assert (=> b!379451 (= lt!177266 (tuple2!6067 k0!778 v!373))))

(declare-datatypes ((Unit!11685 0))(
  ( (Unit!11686) )
))
(declare-fun lt!177263 () Unit!11685)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 (array!22186 array!22184 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) (_ BitVec 64) V!13291 (_ BitVec 32) Int) Unit!11685)

(assert (=> b!379451 (= lt!177263 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!793 (array!22186 array!22184 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!379451 (= lt!177258 (getCurrentListMapNoExtraKeys!793 lt!177264 lt!177262 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379451 (= lt!177262 (array!22185 (store (arr!10560 _values!506) i!548 (ValueCellFull!4226 v!373)) (size!10912 _values!506)))))

(assert (=> b!379451 (= lt!177267 (getCurrentListMapNoExtraKeys!793 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379452 () Bool)

(declare-fun e!230857 () Bool)

(assert (=> b!379452 (= e!230857 (bvsle #b00000000000000000000000000000000 (size!10913 _keys!658)))))

(declare-fun lt!177257 () ListLongMap!4981)

(declare-fun lt!177261 () ListLongMap!4981)

(assert (=> b!379452 (= lt!177257 (+!902 lt!177261 lt!177266))))

(declare-fun lt!177256 () Unit!11685)

(declare-fun addCommutativeForDiffKeys!314 (ListLongMap!4981 (_ BitVec 64) V!13291 (_ BitVec 64) V!13291) Unit!11685)

(assert (=> b!379452 (= lt!177256 (addCommutativeForDiffKeys!314 lt!177267 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379453 () Bool)

(declare-fun res!215201 () Bool)

(declare-fun e!230861 () Bool)

(assert (=> b!379453 (=> (not res!215201) (not e!230861))))

(declare-fun arrayContainsKey!0 (array!22186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379453 (= res!215201 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!215200 () Bool)

(assert (=> start!37350 (=> (not res!215200) (not e!230861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37350 (= res!215200 (validMask!0 mask!970))))

(assert (=> start!37350 e!230861))

(declare-fun e!230858 () Bool)

(declare-fun array_inv!7824 (array!22184) Bool)

(assert (=> start!37350 (and (array_inv!7824 _values!506) e!230858)))

(assert (=> start!37350 tp!30189))

(assert (=> start!37350 true))

(declare-fun tp_is_empty!9139 () Bool)

(assert (=> start!37350 tp_is_empty!9139))

(declare-fun array_inv!7825 (array!22186) Bool)

(assert (=> start!37350 (array_inv!7825 _keys!658)))

(declare-fun b!379454 () Bool)

(declare-fun e!230859 () Bool)

(assert (=> b!379454 (= e!230859 tp_is_empty!9139)))

(declare-fun b!379455 () Bool)

(assert (=> b!379455 (= e!230862 tp_is_empty!9139)))

(declare-fun mapIsEmpty!15273 () Bool)

(assert (=> mapIsEmpty!15273 mapRes!15273))

(declare-fun b!379456 () Bool)

(declare-fun res!215198 () Bool)

(assert (=> b!379456 (=> (not res!215198) (not e!230861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22186 (_ BitVec 32)) Bool)

(assert (=> b!379456 (= res!215198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379457 () Bool)

(declare-fun res!215195 () Bool)

(assert (=> b!379457 (=> (not res!215195) (not e!230861))))

(declare-datatypes ((List!5904 0))(
  ( (Nil!5901) (Cons!5900 (h!6756 (_ BitVec 64)) (t!11046 List!5904)) )
))
(declare-fun arrayNoDuplicates!0 (array!22186 (_ BitVec 32) List!5904) Bool)

(assert (=> b!379457 (= res!215195 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5901))))

(declare-fun b!379458 () Bool)

(declare-fun res!215199 () Bool)

(assert (=> b!379458 (=> (not res!215199) (not e!230856))))

(assert (=> b!379458 (= res!215199 (arrayNoDuplicates!0 lt!177264 #b00000000000000000000000000000000 Nil!5901))))

(declare-fun b!379459 () Bool)

(assert (=> b!379459 (= e!230858 (and e!230859 mapRes!15273))))

(declare-fun condMapEmpty!15273 () Bool)

(declare-fun mapDefault!15273 () ValueCell!4226)

(assert (=> b!379459 (= condMapEmpty!15273 (= (arr!10560 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4226)) mapDefault!15273)))))

(declare-fun b!379460 () Bool)

(declare-fun res!215202 () Bool)

(assert (=> b!379460 (=> (not res!215202) (not e!230861))))

(assert (=> b!379460 (= res!215202 (and (= (size!10912 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10913 _keys!658) (size!10912 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379461 () Bool)

(declare-fun res!215203 () Bool)

(assert (=> b!379461 (=> (not res!215203) (not e!230861))))

(assert (=> b!379461 (= res!215203 (or (= (select (arr!10561 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10561 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379462 () Bool)

(assert (=> b!379462 (= e!230855 e!230857)))

(declare-fun res!215196 () Bool)

(assert (=> b!379462 (=> res!215196 e!230857)))

(assert (=> b!379462 (= res!215196 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379462 (= lt!177260 lt!177261)))

(declare-fun lt!177268 () tuple2!6066)

(assert (=> b!379462 (= lt!177261 (+!902 lt!177267 lt!177268))))

(assert (=> b!379462 (= lt!177265 lt!177257)))

(assert (=> b!379462 (= lt!177257 (+!902 lt!177259 lt!177268))))

(assert (=> b!379462 (= lt!177265 (+!902 lt!177258 lt!177268))))

(assert (=> b!379462 (= lt!177268 (tuple2!6067 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379463 () Bool)

(declare-fun res!215193 () Bool)

(assert (=> b!379463 (=> (not res!215193) (not e!230861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379463 (= res!215193 (validKeyInArray!0 k0!778))))

(declare-fun b!379464 () Bool)

(assert (=> b!379464 (= e!230861 e!230856)))

(declare-fun res!215194 () Bool)

(assert (=> b!379464 (=> (not res!215194) (not e!230856))))

(assert (=> b!379464 (= res!215194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177264 mask!970))))

(assert (=> b!379464 (= lt!177264 (array!22187 (store (arr!10561 _keys!658) i!548 k0!778) (size!10913 _keys!658)))))

(declare-fun b!379465 () Bool)

(declare-fun res!215197 () Bool)

(assert (=> b!379465 (=> (not res!215197) (not e!230861))))

(assert (=> b!379465 (= res!215197 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10913 _keys!658))))))

(assert (= (and start!37350 res!215200) b!379460))

(assert (= (and b!379460 res!215202) b!379456))

(assert (= (and b!379456 res!215198) b!379457))

(assert (= (and b!379457 res!215195) b!379465))

(assert (= (and b!379465 res!215197) b!379463))

(assert (= (and b!379463 res!215193) b!379461))

(assert (= (and b!379461 res!215203) b!379453))

(assert (= (and b!379453 res!215201) b!379464))

(assert (= (and b!379464 res!215194) b!379458))

(assert (= (and b!379458 res!215199) b!379451))

(assert (= (and b!379451 (not res!215204)) b!379462))

(assert (= (and b!379462 (not res!215196)) b!379452))

(assert (= (and b!379459 condMapEmpty!15273) mapIsEmpty!15273))

(assert (= (and b!379459 (not condMapEmpty!15273)) mapNonEmpty!15273))

(get-info :version)

(assert (= (and mapNonEmpty!15273 ((_ is ValueCellFull!4226) mapValue!15273)) b!379455))

(assert (= (and b!379459 ((_ is ValueCellFull!4226) mapDefault!15273)) b!379454))

(assert (= start!37350 b!379459))

(declare-fun m!376613 () Bool)

(assert (=> b!379464 m!376613))

(declare-fun m!376615 () Bool)

(assert (=> b!379464 m!376615))

(declare-fun m!376617 () Bool)

(assert (=> b!379457 m!376617))

(declare-fun m!376619 () Bool)

(assert (=> start!37350 m!376619))

(declare-fun m!376621 () Bool)

(assert (=> start!37350 m!376621))

(declare-fun m!376623 () Bool)

(assert (=> start!37350 m!376623))

(declare-fun m!376625 () Bool)

(assert (=> b!379461 m!376625))

(declare-fun m!376627 () Bool)

(assert (=> b!379453 m!376627))

(declare-fun m!376629 () Bool)

(assert (=> b!379451 m!376629))

(declare-fun m!376631 () Bool)

(assert (=> b!379451 m!376631))

(declare-fun m!376633 () Bool)

(assert (=> b!379451 m!376633))

(declare-fun m!376635 () Bool)

(assert (=> b!379451 m!376635))

(declare-fun m!376637 () Bool)

(assert (=> b!379451 m!376637))

(declare-fun m!376639 () Bool)

(assert (=> b!379451 m!376639))

(declare-fun m!376641 () Bool)

(assert (=> b!379451 m!376641))

(declare-fun m!376643 () Bool)

(assert (=> b!379463 m!376643))

(declare-fun m!376645 () Bool)

(assert (=> b!379458 m!376645))

(declare-fun m!376647 () Bool)

(assert (=> mapNonEmpty!15273 m!376647))

(declare-fun m!376649 () Bool)

(assert (=> b!379462 m!376649))

(declare-fun m!376651 () Bool)

(assert (=> b!379462 m!376651))

(declare-fun m!376653 () Bool)

(assert (=> b!379462 m!376653))

(declare-fun m!376655 () Bool)

(assert (=> b!379456 m!376655))

(declare-fun m!376657 () Bool)

(assert (=> b!379452 m!376657))

(declare-fun m!376659 () Bool)

(assert (=> b!379452 m!376659))

(check-sat (not b!379458) b_and!15747 (not b!379452) (not b!379463) (not b!379456) (not b!379462) (not start!37350) (not mapNonEmpty!15273) tp_is_empty!9139 (not b!379457) (not b!379453) (not b!379464) (not b_next!8491) (not b!379451))
(check-sat b_and!15747 (not b_next!8491))
