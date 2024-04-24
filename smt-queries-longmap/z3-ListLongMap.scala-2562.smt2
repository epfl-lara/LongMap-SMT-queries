; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39176 () Bool)

(assert start!39176)

(declare-fun b_free!9457 () Bool)

(declare-fun b_next!9457 () Bool)

(assert (=> start!39176 (= b_free!9457 (not b_next!9457))))

(declare-fun tp!33899 () Bool)

(declare-fun b_and!16857 () Bool)

(assert (=> start!39176 (= tp!33899 b_and!16857)))

(declare-fun mapNonEmpty!17535 () Bool)

(declare-fun mapRes!17535 () Bool)

(declare-fun tp!33900 () Bool)

(declare-fun e!246959 () Bool)

(assert (=> mapNonEmpty!17535 (= mapRes!17535 (and tp!33900 e!246959))))

(declare-datatypes ((V!15251 0))(
  ( (V!15252 (val!5349 Int)) )
))
(declare-datatypes ((ValueCell!4961 0))(
  ( (ValueCellFull!4961 (v!7597 V!15251)) (EmptyCell!4961) )
))
(declare-fun mapRest!17535 () (Array (_ BitVec 32) ValueCell!4961))

(declare-datatypes ((array!25080 0))(
  ( (array!25081 (arr!11989 (Array (_ BitVec 32) ValueCell!4961)) (size!12341 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25080)

(declare-fun mapValue!17535 () ValueCell!4961)

(declare-fun mapKey!17535 () (_ BitVec 32))

(assert (=> mapNonEmpty!17535 (= (arr!11989 _values!549) (store mapRest!17535 mapKey!17535 mapValue!17535))))

(declare-fun res!239849 () Bool)

(declare-fun e!246963 () Bool)

(assert (=> start!39176 (=> (not res!239849) (not e!246963))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25082 0))(
  ( (array!25083 (arr!11990 (Array (_ BitVec 32) (_ BitVec 64))) (size!12342 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25082)

(assert (=> start!39176 (= res!239849 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12342 _keys!709))))))

(assert (=> start!39176 e!246963))

(declare-fun tp_is_empty!10609 () Bool)

(assert (=> start!39176 tp_is_empty!10609))

(assert (=> start!39176 tp!33899))

(assert (=> start!39176 true))

(declare-fun e!246960 () Bool)

(declare-fun array_inv!8818 (array!25080) Bool)

(assert (=> start!39176 (and (array_inv!8818 _values!549) e!246960)))

(declare-fun array_inv!8819 (array!25082) Bool)

(assert (=> start!39176 (array_inv!8819 _keys!709)))

(declare-datatypes ((tuple2!6814 0))(
  ( (tuple2!6815 (_1!3418 (_ BitVec 64)) (_2!3418 V!15251)) )
))
(declare-datatypes ((List!6834 0))(
  ( (Nil!6831) (Cons!6830 (h!7686 tuple2!6814) (t!12000 List!6834)) )
))
(declare-datatypes ((ListLongMap!5729 0))(
  ( (ListLongMap!5730 (toList!2880 List!6834)) )
))
(declare-fun call!28536 () ListLongMap!5729)

(declare-fun minValue!515 () V!15251)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189594 () array!25080)

(declare-fun zeroValue!515 () V!15251)

(declare-fun bm!28533 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!189596 () array!25082)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54876 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1132 (array!25082 array!25080 (_ BitVec 32) (_ BitVec 32) V!15251 V!15251 (_ BitVec 32) Int) ListLongMap!5729)

(assert (=> bm!28533 (= call!28536 (getCurrentListMapNoExtraKeys!1132 (ite c!54876 _keys!709 lt!189596) (ite c!54876 _values!549 lt!189594) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412844 () Bool)

(declare-fun res!239852 () Bool)

(assert (=> b!412844 (=> (not res!239852) (not e!246963))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412844 (= res!239852 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12342 _keys!709))))))

(declare-fun b!412845 () Bool)

(declare-fun e!246961 () Bool)

(assert (=> b!412845 (= e!246960 (and e!246961 mapRes!17535))))

(declare-fun condMapEmpty!17535 () Bool)

(declare-fun mapDefault!17535 () ValueCell!4961)

(assert (=> b!412845 (= condMapEmpty!17535 (= (arr!11989 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4961)) mapDefault!17535)))))

(declare-fun mapIsEmpty!17535 () Bool)

(assert (=> mapIsEmpty!17535 mapRes!17535))

(declare-fun b!412846 () Bool)

(declare-fun res!239853 () Bool)

(assert (=> b!412846 (=> (not res!239853) (not e!246963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25082 (_ BitVec 32)) Bool)

(assert (=> b!412846 (= res!239853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412847 () Bool)

(declare-fun res!239859 () Bool)

(declare-fun e!246958 () Bool)

(assert (=> b!412847 (=> (not res!239859) (not e!246958))))

(declare-datatypes ((List!6835 0))(
  ( (Nil!6832) (Cons!6831 (h!7687 (_ BitVec 64)) (t!12001 List!6835)) )
))
(declare-fun arrayNoDuplicates!0 (array!25082 (_ BitVec 32) List!6835) Bool)

(assert (=> b!412847 (= res!239859 (arrayNoDuplicates!0 lt!189596 #b00000000000000000000000000000000 Nil!6832))))

(declare-fun b!412848 () Bool)

(declare-fun res!239855 () Bool)

(assert (=> b!412848 (=> (not res!239855) (not e!246958))))

(assert (=> b!412848 (= res!239855 (bvsle from!863 i!563))))

(declare-fun e!246964 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28537 () ListLongMap!5729)

(declare-fun b!412849 () Bool)

(declare-fun v!412 () V!15251)

(declare-fun +!1160 (ListLongMap!5729 tuple2!6814) ListLongMap!5729)

(assert (=> b!412849 (= e!246964 (= call!28537 (+!1160 call!28536 (tuple2!6815 k0!794 v!412))))))

(declare-fun b!412850 () Bool)

(declare-fun e!246962 () Bool)

(assert (=> b!412850 (= e!246958 e!246962)))

(declare-fun res!239856 () Bool)

(assert (=> b!412850 (=> (not res!239856) (not e!246962))))

(assert (=> b!412850 (= res!239856 (= from!863 i!563))))

(declare-fun lt!189597 () ListLongMap!5729)

(assert (=> b!412850 (= lt!189597 (getCurrentListMapNoExtraKeys!1132 lt!189596 lt!189594 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!412850 (= lt!189594 (array!25081 (store (arr!11989 _values!549) i!563 (ValueCellFull!4961 v!412)) (size!12341 _values!549)))))

(declare-fun lt!189593 () ListLongMap!5729)

(assert (=> b!412850 (= lt!189593 (getCurrentListMapNoExtraKeys!1132 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412851 () Bool)

(assert (=> b!412851 (= e!246959 tp_is_empty!10609)))

(declare-fun b!412852 () Bool)

(declare-fun res!239857 () Bool)

(assert (=> b!412852 (=> (not res!239857) (not e!246963))))

(assert (=> b!412852 (= res!239857 (or (= (select (arr!11990 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11990 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412853 () Bool)

(declare-fun res!239854 () Bool)

(assert (=> b!412853 (=> (not res!239854) (not e!246963))))

(declare-fun arrayContainsKey!0 (array!25082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412853 (= res!239854 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412854 () Bool)

(assert (=> b!412854 (= e!246962 (not true))))

(assert (=> b!412854 e!246964))

(assert (=> b!412854 (= c!54876 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12213 0))(
  ( (Unit!12214) )
))
(declare-fun lt!189595 () Unit!12213)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!374 (array!25082 array!25080 (_ BitVec 32) (_ BitVec 32) V!15251 V!15251 (_ BitVec 32) (_ BitVec 64) V!15251 (_ BitVec 32) Int) Unit!12213)

(assert (=> b!412854 (= lt!189595 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!374 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412855 () Bool)

(declare-fun res!239850 () Bool)

(assert (=> b!412855 (=> (not res!239850) (not e!246963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412855 (= res!239850 (validMask!0 mask!1025))))

(declare-fun b!412856 () Bool)

(declare-fun res!239847 () Bool)

(assert (=> b!412856 (=> (not res!239847) (not e!246963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412856 (= res!239847 (validKeyInArray!0 k0!794))))

(declare-fun bm!28534 () Bool)

(assert (=> bm!28534 (= call!28537 (getCurrentListMapNoExtraKeys!1132 (ite c!54876 lt!189596 _keys!709) (ite c!54876 lt!189594 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412857 () Bool)

(assert (=> b!412857 (= e!246963 e!246958)))

(declare-fun res!239858 () Bool)

(assert (=> b!412857 (=> (not res!239858) (not e!246958))))

(assert (=> b!412857 (= res!239858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189596 mask!1025))))

(assert (=> b!412857 (= lt!189596 (array!25083 (store (arr!11990 _keys!709) i!563 k0!794) (size!12342 _keys!709)))))

(declare-fun b!412858 () Bool)

(declare-fun res!239848 () Bool)

(assert (=> b!412858 (=> (not res!239848) (not e!246963))))

(assert (=> b!412858 (= res!239848 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6832))))

(declare-fun b!412859 () Bool)

(assert (=> b!412859 (= e!246961 tp_is_empty!10609)))

(declare-fun b!412860 () Bool)

(declare-fun res!239851 () Bool)

(assert (=> b!412860 (=> (not res!239851) (not e!246963))))

(assert (=> b!412860 (= res!239851 (and (= (size!12341 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12342 _keys!709) (size!12341 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412861 () Bool)

(assert (=> b!412861 (= e!246964 (= call!28536 call!28537))))

(assert (= (and start!39176 res!239849) b!412855))

(assert (= (and b!412855 res!239850) b!412860))

(assert (= (and b!412860 res!239851) b!412846))

(assert (= (and b!412846 res!239853) b!412858))

(assert (= (and b!412858 res!239848) b!412844))

(assert (= (and b!412844 res!239852) b!412856))

(assert (= (and b!412856 res!239847) b!412852))

(assert (= (and b!412852 res!239857) b!412853))

(assert (= (and b!412853 res!239854) b!412857))

(assert (= (and b!412857 res!239858) b!412847))

(assert (= (and b!412847 res!239859) b!412848))

(assert (= (and b!412848 res!239855) b!412850))

(assert (= (and b!412850 res!239856) b!412854))

(assert (= (and b!412854 c!54876) b!412849))

(assert (= (and b!412854 (not c!54876)) b!412861))

(assert (= (or b!412849 b!412861) bm!28534))

(assert (= (or b!412849 b!412861) bm!28533))

(assert (= (and b!412845 condMapEmpty!17535) mapIsEmpty!17535))

(assert (= (and b!412845 (not condMapEmpty!17535)) mapNonEmpty!17535))

(get-info :version)

(assert (= (and mapNonEmpty!17535 ((_ is ValueCellFull!4961) mapValue!17535)) b!412851))

(assert (= (and b!412845 ((_ is ValueCellFull!4961) mapDefault!17535)) b!412859))

(assert (= start!39176 b!412845))

(declare-fun m!402783 () Bool)

(assert (=> b!412857 m!402783))

(declare-fun m!402785 () Bool)

(assert (=> b!412857 m!402785))

(declare-fun m!402787 () Bool)

(assert (=> b!412850 m!402787))

(declare-fun m!402789 () Bool)

(assert (=> b!412850 m!402789))

(declare-fun m!402791 () Bool)

(assert (=> b!412850 m!402791))

(declare-fun m!402793 () Bool)

(assert (=> bm!28534 m!402793))

(declare-fun m!402795 () Bool)

(assert (=> b!412853 m!402795))

(declare-fun m!402797 () Bool)

(assert (=> b!412847 m!402797))

(declare-fun m!402799 () Bool)

(assert (=> b!412855 m!402799))

(declare-fun m!402801 () Bool)

(assert (=> b!412846 m!402801))

(declare-fun m!402803 () Bool)

(assert (=> bm!28533 m!402803))

(declare-fun m!402805 () Bool)

(assert (=> b!412854 m!402805))

(declare-fun m!402807 () Bool)

(assert (=> b!412852 m!402807))

(declare-fun m!402809 () Bool)

(assert (=> mapNonEmpty!17535 m!402809))

(declare-fun m!402811 () Bool)

(assert (=> b!412849 m!402811))

(declare-fun m!402813 () Bool)

(assert (=> b!412858 m!402813))

(declare-fun m!402815 () Bool)

(assert (=> start!39176 m!402815))

(declare-fun m!402817 () Bool)

(assert (=> start!39176 m!402817))

(declare-fun m!402819 () Bool)

(assert (=> b!412856 m!402819))

(check-sat (not b!412850) (not mapNonEmpty!17535) (not b!412855) (not b_next!9457) (not b!412856) (not b!412849) (not bm!28534) (not b!412847) (not b!412853) (not bm!28533) (not b!412854) (not b!412857) tp_is_empty!10609 (not start!39176) b_and!16857 (not b!412858) (not b!412846))
(check-sat b_and!16857 (not b_next!9457))
