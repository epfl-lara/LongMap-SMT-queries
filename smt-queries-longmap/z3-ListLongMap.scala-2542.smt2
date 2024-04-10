; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39072 () Bool)

(assert start!39072)

(declare-fun b_free!9339 () Bool)

(declare-fun b_next!9339 () Bool)

(assert (=> start!39072 (= b_free!9339 (not b_next!9339))))

(declare-fun tp!33546 () Bool)

(declare-fun b_and!16725 () Bool)

(assert (=> start!39072 (= tp!33546 b_and!16725)))

(declare-fun b!410232 () Bool)

(declare-fun e!245924 () Bool)

(assert (=> b!410232 (= e!245924 false)))

(declare-datatypes ((V!15093 0))(
  ( (V!15094 (val!5290 Int)) )
))
(declare-fun minValue!515 () V!15093)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4902 0))(
  ( (ValueCellFull!4902 (v!7537 V!15093)) (EmptyCell!4902) )
))
(declare-datatypes ((array!24853 0))(
  ( (array!24854 (arr!11876 (Array (_ BitVec 32) ValueCell!4902)) (size!12228 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24853)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24855 0))(
  ( (array!24856 (arr!11877 (Array (_ BitVec 32) (_ BitVec 64))) (size!12229 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24855)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15093)

(declare-datatypes ((tuple2!6860 0))(
  ( (tuple2!6861 (_1!3441 (_ BitVec 64)) (_2!3441 V!15093)) )
))
(declare-datatypes ((List!6884 0))(
  ( (Nil!6881) (Cons!6880 (h!7736 tuple2!6860) (t!12058 List!6884)) )
))
(declare-datatypes ((ListLongMap!5773 0))(
  ( (ListLongMap!5774 (toList!2902 List!6884)) )
))
(declare-fun lt!189053 () ListLongMap!5773)

(declare-fun getCurrentListMapNoExtraKeys!1110 (array!24855 array!24853 (_ BitVec 32) (_ BitVec 32) V!15093 V!15093 (_ BitVec 32) Int) ListLongMap!5773)

(assert (=> b!410232 (= lt!189053 (getCurrentListMapNoExtraKeys!1110 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!237724 () Bool)

(declare-fun e!245925 () Bool)

(assert (=> start!39072 (=> (not res!237724) (not e!245925))))

(assert (=> start!39072 (= res!237724 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12229 _keys!709))))))

(assert (=> start!39072 e!245925))

(declare-fun tp_is_empty!10491 () Bool)

(assert (=> start!39072 tp_is_empty!10491))

(assert (=> start!39072 tp!33546))

(assert (=> start!39072 true))

(declare-fun e!245928 () Bool)

(declare-fun array_inv!8668 (array!24853) Bool)

(assert (=> start!39072 (and (array_inv!8668 _values!549) e!245928)))

(declare-fun array_inv!8669 (array!24855) Bool)

(assert (=> start!39072 (array_inv!8669 _keys!709)))

(declare-fun b!410233 () Bool)

(declare-fun res!237731 () Bool)

(assert (=> b!410233 (=> (not res!237731) (not e!245925))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410233 (= res!237731 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12229 _keys!709))))))

(declare-fun b!410234 () Bool)

(declare-fun e!245927 () Bool)

(declare-fun mapRes!17358 () Bool)

(assert (=> b!410234 (= e!245928 (and e!245927 mapRes!17358))))

(declare-fun condMapEmpty!17358 () Bool)

(declare-fun mapDefault!17358 () ValueCell!4902)

(assert (=> b!410234 (= condMapEmpty!17358 (= (arr!11876 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4902)) mapDefault!17358)))))

(declare-fun b!410235 () Bool)

(declare-fun res!237725 () Bool)

(assert (=> b!410235 (=> (not res!237725) (not e!245925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410235 (= res!237725 (validMask!0 mask!1025))))

(declare-fun b!410236 () Bool)

(declare-fun res!237733 () Bool)

(assert (=> b!410236 (=> (not res!237733) (not e!245924))))

(declare-fun lt!189052 () array!24855)

(declare-datatypes ((List!6885 0))(
  ( (Nil!6882) (Cons!6881 (h!7737 (_ BitVec 64)) (t!12059 List!6885)) )
))
(declare-fun arrayNoDuplicates!0 (array!24855 (_ BitVec 32) List!6885) Bool)

(assert (=> b!410236 (= res!237733 (arrayNoDuplicates!0 lt!189052 #b00000000000000000000000000000000 Nil!6882))))

(declare-fun b!410237 () Bool)

(declare-fun res!237734 () Bool)

(assert (=> b!410237 (=> (not res!237734) (not e!245924))))

(assert (=> b!410237 (= res!237734 (bvsle from!863 i!563))))

(declare-fun b!410238 () Bool)

(assert (=> b!410238 (= e!245927 tp_is_empty!10491)))

(declare-fun b!410239 () Bool)

(declare-fun res!237730 () Bool)

(assert (=> b!410239 (=> (not res!237730) (not e!245925))))

(assert (=> b!410239 (= res!237730 (and (= (size!12228 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12229 _keys!709) (size!12228 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17358 () Bool)

(assert (=> mapIsEmpty!17358 mapRes!17358))

(declare-fun b!410240 () Bool)

(declare-fun res!237732 () Bool)

(assert (=> b!410240 (=> (not res!237732) (not e!245925))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410240 (= res!237732 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410241 () Bool)

(declare-fun res!237728 () Bool)

(assert (=> b!410241 (=> (not res!237728) (not e!245925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24855 (_ BitVec 32)) Bool)

(assert (=> b!410241 (= res!237728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410242 () Bool)

(declare-fun res!237727 () Bool)

(assert (=> b!410242 (=> (not res!237727) (not e!245925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410242 (= res!237727 (validKeyInArray!0 k0!794))))

(declare-fun b!410243 () Bool)

(assert (=> b!410243 (= e!245925 e!245924)))

(declare-fun res!237729 () Bool)

(assert (=> b!410243 (=> (not res!237729) (not e!245924))))

(assert (=> b!410243 (= res!237729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189052 mask!1025))))

(assert (=> b!410243 (= lt!189052 (array!24856 (store (arr!11877 _keys!709) i!563 k0!794) (size!12229 _keys!709)))))

(declare-fun mapNonEmpty!17358 () Bool)

(declare-fun tp!33545 () Bool)

(declare-fun e!245923 () Bool)

(assert (=> mapNonEmpty!17358 (= mapRes!17358 (and tp!33545 e!245923))))

(declare-fun mapKey!17358 () (_ BitVec 32))

(declare-fun mapValue!17358 () ValueCell!4902)

(declare-fun mapRest!17358 () (Array (_ BitVec 32) ValueCell!4902))

(assert (=> mapNonEmpty!17358 (= (arr!11876 _values!549) (store mapRest!17358 mapKey!17358 mapValue!17358))))

(declare-fun b!410244 () Bool)

(declare-fun res!237735 () Bool)

(assert (=> b!410244 (=> (not res!237735) (not e!245925))))

(assert (=> b!410244 (= res!237735 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6882))))

(declare-fun b!410245 () Bool)

(assert (=> b!410245 (= e!245923 tp_is_empty!10491)))

(declare-fun b!410246 () Bool)

(declare-fun res!237726 () Bool)

(assert (=> b!410246 (=> (not res!237726) (not e!245925))))

(assert (=> b!410246 (= res!237726 (or (= (select (arr!11877 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11877 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39072 res!237724) b!410235))

(assert (= (and b!410235 res!237725) b!410239))

(assert (= (and b!410239 res!237730) b!410241))

(assert (= (and b!410241 res!237728) b!410244))

(assert (= (and b!410244 res!237735) b!410233))

(assert (= (and b!410233 res!237731) b!410242))

(assert (= (and b!410242 res!237727) b!410246))

(assert (= (and b!410246 res!237726) b!410240))

(assert (= (and b!410240 res!237732) b!410243))

(assert (= (and b!410243 res!237729) b!410236))

(assert (= (and b!410236 res!237733) b!410237))

(assert (= (and b!410237 res!237734) b!410232))

(assert (= (and b!410234 condMapEmpty!17358) mapIsEmpty!17358))

(assert (= (and b!410234 (not condMapEmpty!17358)) mapNonEmpty!17358))

(get-info :version)

(assert (= (and mapNonEmpty!17358 ((_ is ValueCellFull!4902) mapValue!17358)) b!410245))

(assert (= (and b!410234 ((_ is ValueCellFull!4902) mapDefault!17358)) b!410238))

(assert (= start!39072 b!410234))

(declare-fun m!400803 () Bool)

(assert (=> b!410236 m!400803))

(declare-fun m!400805 () Bool)

(assert (=> mapNonEmpty!17358 m!400805))

(declare-fun m!400807 () Bool)

(assert (=> start!39072 m!400807))

(declare-fun m!400809 () Bool)

(assert (=> start!39072 m!400809))

(declare-fun m!400811 () Bool)

(assert (=> b!410240 m!400811))

(declare-fun m!400813 () Bool)

(assert (=> b!410246 m!400813))

(declare-fun m!400815 () Bool)

(assert (=> b!410242 m!400815))

(declare-fun m!400817 () Bool)

(assert (=> b!410243 m!400817))

(declare-fun m!400819 () Bool)

(assert (=> b!410243 m!400819))

(declare-fun m!400821 () Bool)

(assert (=> b!410232 m!400821))

(declare-fun m!400823 () Bool)

(assert (=> b!410235 m!400823))

(declare-fun m!400825 () Bool)

(assert (=> b!410244 m!400825))

(declare-fun m!400827 () Bool)

(assert (=> b!410241 m!400827))

(check-sat (not start!39072) (not b!410244) (not b!410232) (not b!410242) (not b!410236) (not mapNonEmpty!17358) b_and!16725 (not b!410241) (not b_next!9339) tp_is_empty!10491 (not b!410243) (not b!410235) (not b!410240))
(check-sat b_and!16725 (not b_next!9339))
