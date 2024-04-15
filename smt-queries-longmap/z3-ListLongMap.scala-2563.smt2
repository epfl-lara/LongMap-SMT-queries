; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39182 () Bool)

(assert start!39182)

(declare-fun b_free!9463 () Bool)

(declare-fun b_next!9463 () Bool)

(assert (=> start!39182 (= b_free!9463 (not b_next!9463))))

(declare-fun tp!33917 () Bool)

(declare-fun b_and!16823 () Bool)

(assert (=> start!39182 (= tp!33917 b_and!16823)))

(declare-datatypes ((V!15259 0))(
  ( (V!15260 (val!5352 Int)) )
))
(declare-fun minValue!515 () V!15259)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6930 0))(
  ( (tuple2!6931 (_1!3476 (_ BitVec 64)) (_2!3476 V!15259)) )
))
(declare-datatypes ((List!6949 0))(
  ( (Nil!6946) (Cons!6945 (h!7801 tuple2!6930) (t!12114 List!6949)) )
))
(declare-datatypes ((ListLongMap!5833 0))(
  ( (ListLongMap!5834 (toList!2932 List!6949)) )
))
(declare-fun call!28542 () ListLongMap!5833)

(declare-datatypes ((ValueCell!4964 0))(
  ( (ValueCellFull!4964 (v!7593 V!15259)) (EmptyCell!4964) )
))
(declare-datatypes ((array!25081 0))(
  ( (array!25082 (arr!11990 (Array (_ BitVec 32) ValueCell!4964)) (size!12343 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25081)

(declare-fun zeroValue!515 () V!15259)

(declare-fun bm!28539 () Bool)

(declare-fun lt!189388 () array!25081)

(declare-fun c!54837 () Bool)

(declare-datatypes ((array!25083 0))(
  ( (array!25084 (arr!11991 (Array (_ BitVec 32) (_ BitVec 64))) (size!12344 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25083)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!189385 () array!25083)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1146 (array!25083 array!25081 (_ BitVec 32) (_ BitVec 32) V!15259 V!15259 (_ BitVec 32) Int) ListLongMap!5833)

(assert (=> bm!28539 (= call!28542 (getCurrentListMapNoExtraKeys!1146 (ite c!54837 lt!189385 _keys!709) (ite c!54837 lt!189388 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17544 () Bool)

(declare-fun mapRes!17544 () Bool)

(assert (=> mapIsEmpty!17544 mapRes!17544))

(declare-fun b!412785 () Bool)

(declare-fun e!246887 () Bool)

(declare-fun e!246889 () Bool)

(assert (=> b!412785 (= e!246887 (and e!246889 mapRes!17544))))

(declare-fun condMapEmpty!17544 () Bool)

(declare-fun mapDefault!17544 () ValueCell!4964)

(assert (=> b!412785 (= condMapEmpty!17544 (= (arr!11990 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4964)) mapDefault!17544)))))

(declare-fun b!412786 () Bool)

(declare-fun res!239848 () Bool)

(declare-fun e!246892 () Bool)

(assert (=> b!412786 (=> (not res!239848) (not e!246892))))

(declare-datatypes ((List!6950 0))(
  ( (Nil!6947) (Cons!6946 (h!7802 (_ BitVec 64)) (t!12115 List!6950)) )
))
(declare-fun arrayNoDuplicates!0 (array!25083 (_ BitVec 32) List!6950) Bool)

(assert (=> b!412786 (= res!239848 (arrayNoDuplicates!0 lt!189385 #b00000000000000000000000000000000 Nil!6947))))

(declare-fun call!28543 () ListLongMap!5833)

(declare-fun b!412787 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15259)

(declare-fun e!246893 () Bool)

(declare-fun +!1176 (ListLongMap!5833 tuple2!6930) ListLongMap!5833)

(assert (=> b!412787 (= e!246893 (= call!28542 (+!1176 call!28543 (tuple2!6931 k0!794 v!412))))))

(declare-fun b!412788 () Bool)

(declare-fun e!246890 () Bool)

(assert (=> b!412788 (= e!246890 (not true))))

(assert (=> b!412788 e!246893))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412788 (= c!54837 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12196 0))(
  ( (Unit!12197) )
))
(declare-fun lt!189389 () Unit!12196)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!361 (array!25083 array!25081 (_ BitVec 32) (_ BitVec 32) V!15259 V!15259 (_ BitVec 32) (_ BitVec 64) V!15259 (_ BitVec 32) Int) Unit!12196)

(assert (=> b!412788 (= lt!189389 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!361 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412789 () Bool)

(declare-fun res!239839 () Bool)

(declare-fun e!246891 () Bool)

(assert (=> b!412789 (=> (not res!239839) (not e!246891))))

(declare-fun arrayContainsKey!0 (array!25083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412789 (= res!239839 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412790 () Bool)

(declare-fun res!239842 () Bool)

(assert (=> b!412790 (=> (not res!239842) (not e!246891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25083 (_ BitVec 32)) Bool)

(assert (=> b!412790 (= res!239842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412791 () Bool)

(assert (=> b!412791 (= e!246892 e!246890)))

(declare-fun res!239846 () Bool)

(assert (=> b!412791 (=> (not res!239846) (not e!246890))))

(assert (=> b!412791 (= res!239846 (= from!863 i!563))))

(declare-fun lt!189386 () ListLongMap!5833)

(assert (=> b!412791 (= lt!189386 (getCurrentListMapNoExtraKeys!1146 lt!189385 lt!189388 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!412791 (= lt!189388 (array!25082 (store (arr!11990 _values!549) i!563 (ValueCellFull!4964 v!412)) (size!12343 _values!549)))))

(declare-fun lt!189387 () ListLongMap!5833)

(assert (=> b!412791 (= lt!189387 (getCurrentListMapNoExtraKeys!1146 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412792 () Bool)

(assert (=> b!412792 (= e!246893 (= call!28543 call!28542))))

(declare-fun b!412793 () Bool)

(declare-fun res!239843 () Bool)

(assert (=> b!412793 (=> (not res!239843) (not e!246891))))

(assert (=> b!412793 (= res!239843 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12344 _keys!709))))))

(declare-fun b!412794 () Bool)

(declare-fun e!246888 () Bool)

(declare-fun tp_is_empty!10615 () Bool)

(assert (=> b!412794 (= e!246888 tp_is_empty!10615)))

(declare-fun b!412795 () Bool)

(assert (=> b!412795 (= e!246889 tp_is_empty!10615)))

(declare-fun mapNonEmpty!17544 () Bool)

(declare-fun tp!33918 () Bool)

(assert (=> mapNonEmpty!17544 (= mapRes!17544 (and tp!33918 e!246888))))

(declare-fun mapRest!17544 () (Array (_ BitVec 32) ValueCell!4964))

(declare-fun mapValue!17544 () ValueCell!4964)

(declare-fun mapKey!17544 () (_ BitVec 32))

(assert (=> mapNonEmpty!17544 (= (arr!11990 _values!549) (store mapRest!17544 mapKey!17544 mapValue!17544))))

(declare-fun b!412784 () Bool)

(declare-fun res!239844 () Bool)

(assert (=> b!412784 (=> (not res!239844) (not e!246891))))

(assert (=> b!412784 (= res!239844 (and (= (size!12343 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12344 _keys!709) (size!12343 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!239849 () Bool)

(assert (=> start!39182 (=> (not res!239849) (not e!246891))))

(assert (=> start!39182 (= res!239849 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12344 _keys!709))))))

(assert (=> start!39182 e!246891))

(assert (=> start!39182 tp_is_empty!10615))

(assert (=> start!39182 tp!33917))

(assert (=> start!39182 true))

(declare-fun array_inv!8798 (array!25081) Bool)

(assert (=> start!39182 (and (array_inv!8798 _values!549) e!246887)))

(declare-fun array_inv!8799 (array!25083) Bool)

(assert (=> start!39182 (array_inv!8799 _keys!709)))

(declare-fun bm!28540 () Bool)

(assert (=> bm!28540 (= call!28543 (getCurrentListMapNoExtraKeys!1146 (ite c!54837 _keys!709 lt!189385) (ite c!54837 _values!549 lt!189388) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412796 () Bool)

(declare-fun res!239841 () Bool)

(assert (=> b!412796 (=> (not res!239841) (not e!246891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412796 (= res!239841 (validKeyInArray!0 k0!794))))

(declare-fun b!412797 () Bool)

(assert (=> b!412797 (= e!246891 e!246892)))

(declare-fun res!239850 () Bool)

(assert (=> b!412797 (=> (not res!239850) (not e!246892))))

(assert (=> b!412797 (= res!239850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189385 mask!1025))))

(assert (=> b!412797 (= lt!189385 (array!25084 (store (arr!11991 _keys!709) i!563 k0!794) (size!12344 _keys!709)))))

(declare-fun b!412798 () Bool)

(declare-fun res!239838 () Bool)

(assert (=> b!412798 (=> (not res!239838) (not e!246891))))

(assert (=> b!412798 (= res!239838 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6947))))

(declare-fun b!412799 () Bool)

(declare-fun res!239840 () Bool)

(assert (=> b!412799 (=> (not res!239840) (not e!246891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412799 (= res!239840 (validMask!0 mask!1025))))

(declare-fun b!412800 () Bool)

(declare-fun res!239847 () Bool)

(assert (=> b!412800 (=> (not res!239847) (not e!246892))))

(assert (=> b!412800 (= res!239847 (bvsle from!863 i!563))))

(declare-fun b!412801 () Bool)

(declare-fun res!239845 () Bool)

(assert (=> b!412801 (=> (not res!239845) (not e!246891))))

(assert (=> b!412801 (= res!239845 (or (= (select (arr!11991 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11991 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39182 res!239849) b!412799))

(assert (= (and b!412799 res!239840) b!412784))

(assert (= (and b!412784 res!239844) b!412790))

(assert (= (and b!412790 res!239842) b!412798))

(assert (= (and b!412798 res!239838) b!412793))

(assert (= (and b!412793 res!239843) b!412796))

(assert (= (and b!412796 res!239841) b!412801))

(assert (= (and b!412801 res!239845) b!412789))

(assert (= (and b!412789 res!239839) b!412797))

(assert (= (and b!412797 res!239850) b!412786))

(assert (= (and b!412786 res!239848) b!412800))

(assert (= (and b!412800 res!239847) b!412791))

(assert (= (and b!412791 res!239846) b!412788))

(assert (= (and b!412788 c!54837) b!412787))

(assert (= (and b!412788 (not c!54837)) b!412792))

(assert (= (or b!412787 b!412792) bm!28539))

(assert (= (or b!412787 b!412792) bm!28540))

(assert (= (and b!412785 condMapEmpty!17544) mapIsEmpty!17544))

(assert (= (and b!412785 (not condMapEmpty!17544)) mapNonEmpty!17544))

(get-info :version)

(assert (= (and mapNonEmpty!17544 ((_ is ValueCellFull!4964) mapValue!17544)) b!412794))

(assert (= (and b!412785 ((_ is ValueCellFull!4964) mapDefault!17544)) b!412795))

(assert (= start!39182 b!412785))

(declare-fun m!401943 () Bool)

(assert (=> b!412796 m!401943))

(declare-fun m!401945 () Bool)

(assert (=> b!412798 m!401945))

(declare-fun m!401947 () Bool)

(assert (=> b!412801 m!401947))

(declare-fun m!401949 () Bool)

(assert (=> b!412791 m!401949))

(declare-fun m!401951 () Bool)

(assert (=> b!412791 m!401951))

(declare-fun m!401953 () Bool)

(assert (=> b!412791 m!401953))

(declare-fun m!401955 () Bool)

(assert (=> b!412789 m!401955))

(declare-fun m!401957 () Bool)

(assert (=> b!412799 m!401957))

(declare-fun m!401959 () Bool)

(assert (=> bm!28539 m!401959))

(declare-fun m!401961 () Bool)

(assert (=> b!412797 m!401961))

(declare-fun m!401963 () Bool)

(assert (=> b!412797 m!401963))

(declare-fun m!401965 () Bool)

(assert (=> b!412786 m!401965))

(declare-fun m!401967 () Bool)

(assert (=> start!39182 m!401967))

(declare-fun m!401969 () Bool)

(assert (=> start!39182 m!401969))

(declare-fun m!401971 () Bool)

(assert (=> mapNonEmpty!17544 m!401971))

(declare-fun m!401973 () Bool)

(assert (=> bm!28540 m!401973))

(declare-fun m!401975 () Bool)

(assert (=> b!412790 m!401975))

(declare-fun m!401977 () Bool)

(assert (=> b!412787 m!401977))

(declare-fun m!401979 () Bool)

(assert (=> b!412788 m!401979))

(check-sat (not b!412788) (not b!412799) (not mapNonEmpty!17544) (not b!412798) (not b!412791) b_and!16823 (not b!412796) (not b!412797) (not bm!28539) (not start!39182) tp_is_empty!10615 (not b!412786) (not b!412787) (not b!412790) (not b!412789) (not bm!28540) (not b_next!9463))
(check-sat b_and!16823 (not b_next!9463))
