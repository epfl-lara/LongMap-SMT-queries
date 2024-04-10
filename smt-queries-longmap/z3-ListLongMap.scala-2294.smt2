; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37228 () Bool)

(assert start!37228)

(declare-fun b_free!8355 () Bool)

(declare-fun b_next!8355 () Bool)

(assert (=> start!37228 (= b_free!8355 (not b_next!8355))))

(declare-fun tp!29780 () Bool)

(declare-fun b_and!15597 () Bool)

(assert (=> start!37228 (= tp!29780 b_and!15597)))

(declare-fun b!376431 () Bool)

(declare-fun res!212746 () Bool)

(declare-fun e!229260 () Bool)

(assert (=> b!376431 (=> (not res!212746) (not e!229260))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376431 (= res!212746 (validKeyInArray!0 k0!778))))

(declare-fun b!376432 () Bool)

(declare-fun res!212745 () Bool)

(assert (=> b!376432 (=> (not res!212745) (not e!229260))))

(declare-datatypes ((array!21935 0))(
  ( (array!21936 (arr!10436 (Array (_ BitVec 32) (_ BitVec 64))) (size!10788 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21935)

(declare-fun arrayContainsKey!0 (array!21935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376432 (= res!212745 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376433 () Bool)

(declare-fun res!212748 () Bool)

(assert (=> b!376433 (=> (not res!212748) (not e!229260))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21935 (_ BitVec 32)) Bool)

(assert (=> b!376433 (= res!212748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376434 () Bool)

(declare-fun e!229261 () Bool)

(declare-fun tp_is_empty!9003 () Bool)

(assert (=> b!376434 (= e!229261 tp_is_empty!9003)))

(declare-fun b!376435 () Bool)

(declare-fun res!212741 () Bool)

(declare-fun e!229255 () Bool)

(assert (=> b!376435 (=> (not res!212741) (not e!229255))))

(declare-fun lt!174629 () array!21935)

(declare-datatypes ((List!5894 0))(
  ( (Nil!5891) (Cons!5890 (h!6746 (_ BitVec 64)) (t!11044 List!5894)) )
))
(declare-fun arrayNoDuplicates!0 (array!21935 (_ BitVec 32) List!5894) Bool)

(assert (=> b!376435 (= res!212741 (arrayNoDuplicates!0 lt!174629 #b00000000000000000000000000000000 Nil!5891))))

(declare-fun b!376436 () Bool)

(declare-fun e!229262 () Bool)

(declare-fun e!229256 () Bool)

(declare-fun mapRes!15069 () Bool)

(assert (=> b!376436 (= e!229262 (and e!229256 mapRes!15069))))

(declare-fun condMapEmpty!15069 () Bool)

(declare-datatypes ((V!13109 0))(
  ( (V!13110 (val!4546 Int)) )
))
(declare-datatypes ((ValueCell!4158 0))(
  ( (ValueCellFull!4158 (v!6743 V!13109)) (EmptyCell!4158) )
))
(declare-datatypes ((array!21937 0))(
  ( (array!21938 (arr!10437 (Array (_ BitVec 32) ValueCell!4158)) (size!10789 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21937)

(declare-fun mapDefault!15069 () ValueCell!4158)

(assert (=> b!376436 (= condMapEmpty!15069 (= (arr!10437 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4158)) mapDefault!15069)))))

(declare-fun b!376437 () Bool)

(declare-fun e!229259 () Bool)

(assert (=> b!376437 (= e!229259 true)))

(declare-datatypes ((tuple2!6052 0))(
  ( (tuple2!6053 (_1!3037 (_ BitVec 64)) (_2!3037 V!13109)) )
))
(declare-datatypes ((List!5895 0))(
  ( (Nil!5892) (Cons!5891 (h!6747 tuple2!6052) (t!11045 List!5895)) )
))
(declare-datatypes ((ListLongMap!4965 0))(
  ( (ListLongMap!4966 (toList!2498 List!5895)) )
))
(declare-fun lt!174624 () ListLongMap!4965)

(declare-fun lt!174630 () ListLongMap!4965)

(declare-fun lt!174622 () tuple2!6052)

(declare-fun +!844 (ListLongMap!4965 tuple2!6052) ListLongMap!4965)

(assert (=> b!376437 (= lt!174624 (+!844 lt!174630 lt!174622))))

(declare-fun v!373 () V!13109)

(declare-fun lt!174628 () ListLongMap!4965)

(declare-fun zeroValue!472 () V!13109)

(declare-datatypes ((Unit!11594 0))(
  ( (Unit!11595) )
))
(declare-fun lt!174625 () Unit!11594)

(declare-fun addCommutativeForDiffKeys!259 (ListLongMap!4965 (_ BitVec 64) V!13109 (_ BitVec 64) V!13109) Unit!11594)

(assert (=> b!376437 (= lt!174625 (addCommutativeForDiffKeys!259 lt!174628 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15069 () Bool)

(assert (=> mapIsEmpty!15069 mapRes!15069))

(declare-fun res!212742 () Bool)

(assert (=> start!37228 (=> (not res!212742) (not e!229260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37228 (= res!212742 (validMask!0 mask!970))))

(assert (=> start!37228 e!229260))

(declare-fun array_inv!7692 (array!21937) Bool)

(assert (=> start!37228 (and (array_inv!7692 _values!506) e!229262)))

(assert (=> start!37228 tp!29780))

(assert (=> start!37228 true))

(assert (=> start!37228 tp_is_empty!9003))

(declare-fun array_inv!7693 (array!21935) Bool)

(assert (=> start!37228 (array_inv!7693 _keys!658)))

(declare-fun b!376438 () Bool)

(assert (=> b!376438 (= e!229256 tp_is_empty!9003)))

(declare-fun b!376439 () Bool)

(declare-fun res!212749 () Bool)

(assert (=> b!376439 (=> (not res!212749) (not e!229260))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376439 (= res!212749 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10788 _keys!658))))))

(declare-fun b!376440 () Bool)

(declare-fun e!229258 () Bool)

(assert (=> b!376440 (= e!229258 e!229259)))

(declare-fun res!212750 () Bool)

(assert (=> b!376440 (=> res!212750 e!229259)))

(assert (=> b!376440 (= res!212750 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174621 () ListLongMap!4965)

(assert (=> b!376440 (= lt!174621 lt!174624)))

(declare-fun lt!174623 () ListLongMap!4965)

(declare-fun lt!174632 () tuple2!6052)

(assert (=> b!376440 (= lt!174624 (+!844 lt!174623 lt!174632))))

(declare-fun lt!174633 () ListLongMap!4965)

(assert (=> b!376440 (= lt!174633 lt!174630)))

(assert (=> b!376440 (= lt!174630 (+!844 lt!174628 lt!174632))))

(declare-fun lt!174626 () ListLongMap!4965)

(assert (=> b!376440 (= lt!174621 (+!844 lt!174626 lt!174632))))

(assert (=> b!376440 (= lt!174632 (tuple2!6053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376441 () Bool)

(assert (=> b!376441 (= e!229260 e!229255)))

(declare-fun res!212743 () Bool)

(assert (=> b!376441 (=> (not res!212743) (not e!229255))))

(assert (=> b!376441 (= res!212743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174629 mask!970))))

(assert (=> b!376441 (= lt!174629 (array!21936 (store (arr!10436 _keys!658) i!548 k0!778) (size!10788 _keys!658)))))

(declare-fun b!376442 () Bool)

(declare-fun res!212744 () Bool)

(assert (=> b!376442 (=> (not res!212744) (not e!229260))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376442 (= res!212744 (and (= (size!10789 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10788 _keys!658) (size!10789 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376443 () Bool)

(declare-fun res!212747 () Bool)

(assert (=> b!376443 (=> (not res!212747) (not e!229260))))

(assert (=> b!376443 (= res!212747 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5891))))

(declare-fun b!376444 () Bool)

(assert (=> b!376444 (= e!229255 (not e!229258))))

(declare-fun res!212739 () Bool)

(assert (=> b!376444 (=> res!212739 e!229258)))

(assert (=> b!376444 (= res!212739 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13109)

(declare-fun getCurrentListMap!1932 (array!21935 array!21937 (_ BitVec 32) (_ BitVec 32) V!13109 V!13109 (_ BitVec 32) Int) ListLongMap!4965)

(assert (=> b!376444 (= lt!174633 (getCurrentListMap!1932 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174627 () array!21937)

(assert (=> b!376444 (= lt!174621 (getCurrentListMap!1932 lt!174629 lt!174627 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376444 (and (= lt!174626 lt!174623) (= lt!174623 lt!174626))))

(assert (=> b!376444 (= lt!174623 (+!844 lt!174628 lt!174622))))

(assert (=> b!376444 (= lt!174622 (tuple2!6053 k0!778 v!373))))

(declare-fun lt!174631 () Unit!11594)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!90 (array!21935 array!21937 (_ BitVec 32) (_ BitVec 32) V!13109 V!13109 (_ BitVec 32) (_ BitVec 64) V!13109 (_ BitVec 32) Int) Unit!11594)

(assert (=> b!376444 (= lt!174631 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!90 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!766 (array!21935 array!21937 (_ BitVec 32) (_ BitVec 32) V!13109 V!13109 (_ BitVec 32) Int) ListLongMap!4965)

(assert (=> b!376444 (= lt!174626 (getCurrentListMapNoExtraKeys!766 lt!174629 lt!174627 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376444 (= lt!174627 (array!21938 (store (arr!10437 _values!506) i!548 (ValueCellFull!4158 v!373)) (size!10789 _values!506)))))

(assert (=> b!376444 (= lt!174628 (getCurrentListMapNoExtraKeys!766 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15069 () Bool)

(declare-fun tp!29781 () Bool)

(assert (=> mapNonEmpty!15069 (= mapRes!15069 (and tp!29781 e!229261))))

(declare-fun mapRest!15069 () (Array (_ BitVec 32) ValueCell!4158))

(declare-fun mapKey!15069 () (_ BitVec 32))

(declare-fun mapValue!15069 () ValueCell!4158)

(assert (=> mapNonEmpty!15069 (= (arr!10437 _values!506) (store mapRest!15069 mapKey!15069 mapValue!15069))))

(declare-fun b!376445 () Bool)

(declare-fun res!212740 () Bool)

(assert (=> b!376445 (=> (not res!212740) (not e!229260))))

(assert (=> b!376445 (= res!212740 (or (= (select (arr!10436 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10436 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37228 res!212742) b!376442))

(assert (= (and b!376442 res!212744) b!376433))

(assert (= (and b!376433 res!212748) b!376443))

(assert (= (and b!376443 res!212747) b!376439))

(assert (= (and b!376439 res!212749) b!376431))

(assert (= (and b!376431 res!212746) b!376445))

(assert (= (and b!376445 res!212740) b!376432))

(assert (= (and b!376432 res!212745) b!376441))

(assert (= (and b!376441 res!212743) b!376435))

(assert (= (and b!376435 res!212741) b!376444))

(assert (= (and b!376444 (not res!212739)) b!376440))

(assert (= (and b!376440 (not res!212750)) b!376437))

(assert (= (and b!376436 condMapEmpty!15069) mapIsEmpty!15069))

(assert (= (and b!376436 (not condMapEmpty!15069)) mapNonEmpty!15069))

(get-info :version)

(assert (= (and mapNonEmpty!15069 ((_ is ValueCellFull!4158) mapValue!15069)) b!376434))

(assert (= (and b!376436 ((_ is ValueCellFull!4158) mapDefault!15069)) b!376438))

(assert (= start!37228 b!376436))

(declare-fun m!373131 () Bool)

(assert (=> start!37228 m!373131))

(declare-fun m!373133 () Bool)

(assert (=> start!37228 m!373133))

(declare-fun m!373135 () Bool)

(assert (=> start!37228 m!373135))

(declare-fun m!373137 () Bool)

(assert (=> b!376443 m!373137))

(declare-fun m!373139 () Bool)

(assert (=> b!376433 m!373139))

(declare-fun m!373141 () Bool)

(assert (=> b!376445 m!373141))

(declare-fun m!373143 () Bool)

(assert (=> b!376432 m!373143))

(declare-fun m!373145 () Bool)

(assert (=> b!376435 m!373145))

(declare-fun m!373147 () Bool)

(assert (=> mapNonEmpty!15069 m!373147))

(declare-fun m!373149 () Bool)

(assert (=> b!376440 m!373149))

(declare-fun m!373151 () Bool)

(assert (=> b!376440 m!373151))

(declare-fun m!373153 () Bool)

(assert (=> b!376440 m!373153))

(declare-fun m!373155 () Bool)

(assert (=> b!376437 m!373155))

(declare-fun m!373157 () Bool)

(assert (=> b!376437 m!373157))

(declare-fun m!373159 () Bool)

(assert (=> b!376444 m!373159))

(declare-fun m!373161 () Bool)

(assert (=> b!376444 m!373161))

(declare-fun m!373163 () Bool)

(assert (=> b!376444 m!373163))

(declare-fun m!373165 () Bool)

(assert (=> b!376444 m!373165))

(declare-fun m!373167 () Bool)

(assert (=> b!376444 m!373167))

(declare-fun m!373169 () Bool)

(assert (=> b!376444 m!373169))

(declare-fun m!373171 () Bool)

(assert (=> b!376444 m!373171))

(declare-fun m!373173 () Bool)

(assert (=> b!376431 m!373173))

(declare-fun m!373175 () Bool)

(assert (=> b!376441 m!373175))

(declare-fun m!373177 () Bool)

(assert (=> b!376441 m!373177))

(check-sat (not b!376432) b_and!15597 (not b!376440) (not b!376437) tp_is_empty!9003 (not b_next!8355) (not mapNonEmpty!15069) (not b!376435) (not b!376441) (not b!376431) (not start!37228) (not b!376443) (not b!376433) (not b!376444))
(check-sat b_and!15597 (not b_next!8355))
