; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37128 () Bool)

(assert start!37128)

(declare-fun b_free!8269 () Bool)

(declare-fun b_next!8269 () Bool)

(assert (=> start!37128 (= b_free!8269 (not b_next!8269))))

(declare-fun tp!29522 () Bool)

(declare-fun b_and!15525 () Bool)

(assert (=> start!37128 (= tp!29522 b_and!15525)))

(declare-fun b!374438 () Bool)

(declare-fun e!228194 () Bool)

(declare-fun e!228191 () Bool)

(assert (=> b!374438 (= e!228194 e!228191)))

(declare-fun res!211185 () Bool)

(assert (=> b!374438 (=> (not res!211185) (not e!228191))))

(declare-datatypes ((array!21754 0))(
  ( (array!21755 (arr!10345 (Array (_ BitVec 32) (_ BitVec 64))) (size!10697 (_ BitVec 32))) )
))
(declare-fun lt!172692 () array!21754)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21754 (_ BitVec 32)) Bool)

(assert (=> b!374438 (= res!211185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172692 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21754)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374438 (= lt!172692 (array!21755 (store (arr!10345 _keys!658) i!548 k0!778) (size!10697 _keys!658)))))

(declare-fun b!374440 () Bool)

(declare-fun res!211189 () Bool)

(assert (=> b!374440 (=> (not res!211189) (not e!228194))))

(assert (=> b!374440 (= res!211189 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10697 _keys!658))))))

(declare-fun b!374441 () Bool)

(declare-fun e!228197 () Bool)

(declare-fun e!228192 () Bool)

(assert (=> b!374441 (= e!228197 e!228192)))

(declare-fun res!211188 () Bool)

(assert (=> b!374441 (=> res!211188 e!228192)))

(assert (=> b!374441 (= res!211188 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12995 0))(
  ( (V!12996 (val!4503 Int)) )
))
(declare-datatypes ((tuple2!5890 0))(
  ( (tuple2!5891 (_1!2956 (_ BitVec 64)) (_2!2956 V!12995)) )
))
(declare-datatypes ((List!5734 0))(
  ( (Nil!5731) (Cons!5730 (h!6586 tuple2!5890) (t!10876 List!5734)) )
))
(declare-datatypes ((ListLongMap!4805 0))(
  ( (ListLongMap!4806 (toList!2418 List!5734)) )
))
(declare-fun lt!172693 () ListLongMap!4805)

(declare-fun lt!172685 () ListLongMap!4805)

(assert (=> b!374441 (= lt!172693 lt!172685)))

(declare-fun lt!172687 () ListLongMap!4805)

(declare-fun lt!172686 () tuple2!5890)

(declare-fun +!814 (ListLongMap!4805 tuple2!5890) ListLongMap!4805)

(assert (=> b!374441 (= lt!172685 (+!814 lt!172687 lt!172686))))

(declare-fun v!373 () V!12995)

(declare-datatypes ((Unit!11517 0))(
  ( (Unit!11518) )
))
(declare-fun lt!172690 () Unit!11517)

(declare-fun zeroValue!472 () V!12995)

(declare-fun lt!172696 () ListLongMap!4805)

(declare-fun addCommutativeForDiffKeys!242 (ListLongMap!4805 (_ BitVec 64) V!12995 (_ BitVec 64) V!12995) Unit!11517)

(assert (=> b!374441 (= lt!172690 (addCommutativeForDiffKeys!242 lt!172696 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172694 () ListLongMap!4805)

(declare-fun lt!172698 () tuple2!5890)

(assert (=> b!374441 (= lt!172694 (+!814 lt!172693 lt!172698))))

(declare-fun lt!172695 () ListLongMap!4805)

(declare-fun lt!172688 () tuple2!5890)

(assert (=> b!374441 (= lt!172693 (+!814 lt!172695 lt!172688))))

(declare-fun lt!172689 () ListLongMap!4805)

(declare-fun lt!172684 () ListLongMap!4805)

(assert (=> b!374441 (= lt!172689 lt!172684)))

(assert (=> b!374441 (= lt!172684 (+!814 lt!172687 lt!172698))))

(assert (=> b!374441 (= lt!172687 (+!814 lt!172696 lt!172688))))

(declare-fun lt!172699 () ListLongMap!4805)

(assert (=> b!374441 (= lt!172694 (+!814 (+!814 lt!172699 lt!172688) lt!172698))))

(declare-fun minValue!472 () V!12995)

(assert (=> b!374441 (= lt!172698 (tuple2!5891 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374441 (= lt!172688 (tuple2!5891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374442 () Bool)

(declare-fun res!211190 () Bool)

(assert (=> b!374442 (=> (not res!211190) (not e!228194))))

(declare-fun arrayContainsKey!0 (array!21754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374442 (= res!211190 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374443 () Bool)

(assert (=> b!374443 (= e!228192 true)))

(assert (=> b!374443 (= (+!814 lt!172685 lt!172698) (+!814 lt!172684 lt!172686))))

(declare-fun lt!172697 () Unit!11517)

(assert (=> b!374443 (= lt!172697 (addCommutativeForDiffKeys!242 lt!172687 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!14940 () Bool)

(declare-fun mapRes!14940 () Bool)

(declare-fun tp!29523 () Bool)

(declare-fun e!228193 () Bool)

(assert (=> mapNonEmpty!14940 (= mapRes!14940 (and tp!29523 e!228193))))

(declare-datatypes ((ValueCell!4115 0))(
  ( (ValueCellFull!4115 (v!6701 V!12995)) (EmptyCell!4115) )
))
(declare-datatypes ((array!21756 0))(
  ( (array!21757 (arr!10346 (Array (_ BitVec 32) ValueCell!4115)) (size!10698 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21756)

(declare-fun mapKey!14940 () (_ BitVec 32))

(declare-fun mapValue!14940 () ValueCell!4115)

(declare-fun mapRest!14940 () (Array (_ BitVec 32) ValueCell!4115))

(assert (=> mapNonEmpty!14940 (= (arr!10346 _values!506) (store mapRest!14940 mapKey!14940 mapValue!14940))))

(declare-fun b!374444 () Bool)

(declare-fun res!211180 () Bool)

(assert (=> b!374444 (=> (not res!211180) (not e!228194))))

(assert (=> b!374444 (= res!211180 (or (= (select (arr!10345 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10345 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374445 () Bool)

(declare-fun res!211183 () Bool)

(assert (=> b!374445 (=> (not res!211183) (not e!228194))))

(assert (=> b!374445 (= res!211183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374446 () Bool)

(declare-fun res!211184 () Bool)

(assert (=> b!374446 (=> (not res!211184) (not e!228191))))

(declare-datatypes ((List!5735 0))(
  ( (Nil!5732) (Cons!5731 (h!6587 (_ BitVec 64)) (t!10877 List!5735)) )
))
(declare-fun arrayNoDuplicates!0 (array!21754 (_ BitVec 32) List!5735) Bool)

(assert (=> b!374446 (= res!211184 (arrayNoDuplicates!0 lt!172692 #b00000000000000000000000000000000 Nil!5732))))

(declare-fun b!374447 () Bool)

(declare-fun e!228196 () Bool)

(declare-fun tp_is_empty!8917 () Bool)

(assert (=> b!374447 (= e!228196 tp_is_empty!8917)))

(declare-fun b!374448 () Bool)

(declare-fun e!228198 () Bool)

(assert (=> b!374448 (= e!228198 (and e!228196 mapRes!14940))))

(declare-fun condMapEmpty!14940 () Bool)

(declare-fun mapDefault!14940 () ValueCell!4115)

(assert (=> b!374448 (= condMapEmpty!14940 (= (arr!10346 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4115)) mapDefault!14940)))))

(declare-fun mapIsEmpty!14940 () Bool)

(assert (=> mapIsEmpty!14940 mapRes!14940))

(declare-fun b!374439 () Bool)

(declare-fun res!211186 () Bool)

(assert (=> b!374439 (=> (not res!211186) (not e!228194))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374439 (= res!211186 (and (= (size!10698 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10697 _keys!658) (size!10698 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!211179 () Bool)

(assert (=> start!37128 (=> (not res!211179) (not e!228194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37128 (= res!211179 (validMask!0 mask!970))))

(assert (=> start!37128 e!228194))

(declare-fun array_inv!7678 (array!21756) Bool)

(assert (=> start!37128 (and (array_inv!7678 _values!506) e!228198)))

(assert (=> start!37128 tp!29522))

(assert (=> start!37128 true))

(assert (=> start!37128 tp_is_empty!8917))

(declare-fun array_inv!7679 (array!21754) Bool)

(assert (=> start!37128 (array_inv!7679 _keys!658)))

(declare-fun b!374449 () Bool)

(declare-fun res!211182 () Bool)

(assert (=> b!374449 (=> (not res!211182) (not e!228194))))

(assert (=> b!374449 (= res!211182 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5732))))

(declare-fun b!374450 () Bool)

(assert (=> b!374450 (= e!228191 (not e!228197))))

(declare-fun res!211181 () Bool)

(assert (=> b!374450 (=> res!211181 e!228197)))

(assert (=> b!374450 (= res!211181 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1876 (array!21754 array!21756 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) Int) ListLongMap!4805)

(assert (=> b!374450 (= lt!172689 (getCurrentListMap!1876 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172683 () array!21756)

(assert (=> b!374450 (= lt!172694 (getCurrentListMap!1876 lt!172692 lt!172683 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374450 (and (= lt!172699 lt!172695) (= lt!172695 lt!172699))))

(assert (=> b!374450 (= lt!172695 (+!814 lt!172696 lt!172686))))

(assert (=> b!374450 (= lt!172686 (tuple2!5891 k0!778 v!373))))

(declare-fun lt!172691 () Unit!11517)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!63 (array!21754 array!21756 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) (_ BitVec 64) V!12995 (_ BitVec 32) Int) Unit!11517)

(assert (=> b!374450 (= lt!172691 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!63 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!723 (array!21754 array!21756 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) Int) ListLongMap!4805)

(assert (=> b!374450 (= lt!172699 (getCurrentListMapNoExtraKeys!723 lt!172692 lt!172683 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374450 (= lt!172683 (array!21757 (store (arr!10346 _values!506) i!548 (ValueCellFull!4115 v!373)) (size!10698 _values!506)))))

(assert (=> b!374450 (= lt!172696 (getCurrentListMapNoExtraKeys!723 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374451 () Bool)

(declare-fun res!211187 () Bool)

(assert (=> b!374451 (=> (not res!211187) (not e!228194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374451 (= res!211187 (validKeyInArray!0 k0!778))))

(declare-fun b!374452 () Bool)

(assert (=> b!374452 (= e!228193 tp_is_empty!8917)))

(assert (= (and start!37128 res!211179) b!374439))

(assert (= (and b!374439 res!211186) b!374445))

(assert (= (and b!374445 res!211183) b!374449))

(assert (= (and b!374449 res!211182) b!374440))

(assert (= (and b!374440 res!211189) b!374451))

(assert (= (and b!374451 res!211187) b!374444))

(assert (= (and b!374444 res!211180) b!374442))

(assert (= (and b!374442 res!211190) b!374438))

(assert (= (and b!374438 res!211185) b!374446))

(assert (= (and b!374446 res!211184) b!374450))

(assert (= (and b!374450 (not res!211181)) b!374441))

(assert (= (and b!374441 (not res!211188)) b!374443))

(assert (= (and b!374448 condMapEmpty!14940) mapIsEmpty!14940))

(assert (= (and b!374448 (not condMapEmpty!14940)) mapNonEmpty!14940))

(get-info :version)

(assert (= (and mapNonEmpty!14940 ((_ is ValueCellFull!4115) mapValue!14940)) b!374452))

(assert (= (and b!374448 ((_ is ValueCellFull!4115) mapDefault!14940)) b!374447))

(assert (= start!37128 b!374448))

(declare-fun m!370985 () Bool)

(assert (=> b!374451 m!370985))

(declare-fun m!370987 () Bool)

(assert (=> b!374438 m!370987))

(declare-fun m!370989 () Bool)

(assert (=> b!374438 m!370989))

(declare-fun m!370991 () Bool)

(assert (=> b!374449 m!370991))

(declare-fun m!370993 () Bool)

(assert (=> b!374443 m!370993))

(declare-fun m!370995 () Bool)

(assert (=> b!374443 m!370995))

(declare-fun m!370997 () Bool)

(assert (=> b!374443 m!370997))

(declare-fun m!370999 () Bool)

(assert (=> b!374446 m!370999))

(declare-fun m!371001 () Bool)

(assert (=> mapNonEmpty!14940 m!371001))

(declare-fun m!371003 () Bool)

(assert (=> b!374444 m!371003))

(declare-fun m!371005 () Bool)

(assert (=> b!374442 m!371005))

(declare-fun m!371007 () Bool)

(assert (=> b!374441 m!371007))

(declare-fun m!371009 () Bool)

(assert (=> b!374441 m!371009))

(declare-fun m!371011 () Bool)

(assert (=> b!374441 m!371011))

(declare-fun m!371013 () Bool)

(assert (=> b!374441 m!371013))

(declare-fun m!371015 () Bool)

(assert (=> b!374441 m!371015))

(declare-fun m!371017 () Bool)

(assert (=> b!374441 m!371017))

(declare-fun m!371019 () Bool)

(assert (=> b!374441 m!371019))

(assert (=> b!374441 m!371013))

(declare-fun m!371021 () Bool)

(assert (=> b!374441 m!371021))

(declare-fun m!371023 () Bool)

(assert (=> b!374450 m!371023))

(declare-fun m!371025 () Bool)

(assert (=> b!374450 m!371025))

(declare-fun m!371027 () Bool)

(assert (=> b!374450 m!371027))

(declare-fun m!371029 () Bool)

(assert (=> b!374450 m!371029))

(declare-fun m!371031 () Bool)

(assert (=> b!374450 m!371031))

(declare-fun m!371033 () Bool)

(assert (=> b!374450 m!371033))

(declare-fun m!371035 () Bool)

(assert (=> b!374450 m!371035))

(declare-fun m!371037 () Bool)

(assert (=> start!37128 m!371037))

(declare-fun m!371039 () Bool)

(assert (=> start!37128 m!371039))

(declare-fun m!371041 () Bool)

(assert (=> start!37128 m!371041))

(declare-fun m!371043 () Bool)

(assert (=> b!374445 m!371043))

(check-sat (not b!374446) (not b!374441) (not b!374443) (not b_next!8269) (not b!374451) (not b!374445) (not b!374438) (not b!374449) tp_is_empty!8917 b_and!15525 (not mapNonEmpty!14940) (not start!37128) (not b!374450) (not b!374442))
(check-sat b_and!15525 (not b_next!8269))
