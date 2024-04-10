; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69908 () Bool)

(assert start!69908)

(declare-fun res!555327 () Bool)

(declare-fun e!450240 () Bool)

(assert (=> start!69908 (=> (not res!555327) (not e!450240))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69908 (= res!555327 (validMask!0 mask!1312))))

(assert (=> start!69908 e!450240))

(declare-datatypes ((array!44340 0))(
  ( (array!44341 (arr!21232 (Array (_ BitVec 32) (_ BitVec 64))) (size!21653 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44340)

(declare-fun array_inv!17009 (array!44340) Bool)

(assert (=> start!69908 (array_inv!17009 _keys!976)))

(assert (=> start!69908 true))

(declare-datatypes ((V!23749 0))(
  ( (V!23750 (val!7078 Int)) )
))
(declare-datatypes ((ValueCell!6615 0))(
  ( (ValueCellFull!6615 (v!9505 V!23749)) (EmptyCell!6615) )
))
(declare-datatypes ((array!44342 0))(
  ( (array!44343 (arr!21233 (Array (_ BitVec 32) ValueCell!6615)) (size!21654 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44342)

(declare-fun e!450241 () Bool)

(declare-fun array_inv!17010 (array!44342) Bool)

(assert (=> start!69908 (and (array_inv!17010 _values!788) e!450241)))

(declare-fun b!812736 () Bool)

(declare-fun e!450242 () Bool)

(declare-fun mapRes!22666 () Bool)

(assert (=> b!812736 (= e!450241 (and e!450242 mapRes!22666))))

(declare-fun condMapEmpty!22666 () Bool)

(declare-fun mapDefault!22666 () ValueCell!6615)

(assert (=> b!812736 (= condMapEmpty!22666 (= (arr!21233 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6615)) mapDefault!22666)))))

(declare-fun b!812737 () Bool)

(assert (=> b!812737 (= e!450240 false)))

(declare-fun lt!364188 () Bool)

(declare-datatypes ((List!15106 0))(
  ( (Nil!15103) (Cons!15102 (h!16231 (_ BitVec 64)) (t!21421 List!15106)) )
))
(declare-fun arrayNoDuplicates!0 (array!44340 (_ BitVec 32) List!15106) Bool)

(assert (=> b!812737 (= lt!364188 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15103))))

(declare-fun b!812738 () Bool)

(declare-fun res!555326 () Bool)

(assert (=> b!812738 (=> (not res!555326) (not e!450240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44340 (_ BitVec 32)) Bool)

(assert (=> b!812738 (= res!555326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812739 () Bool)

(declare-fun tp_is_empty!14061 () Bool)

(assert (=> b!812739 (= e!450242 tp_is_empty!14061)))

(declare-fun b!812740 () Bool)

(declare-fun e!450239 () Bool)

(assert (=> b!812740 (= e!450239 tp_is_empty!14061)))

(declare-fun mapIsEmpty!22666 () Bool)

(assert (=> mapIsEmpty!22666 mapRes!22666))

(declare-fun mapNonEmpty!22666 () Bool)

(declare-fun tp!43774 () Bool)

(assert (=> mapNonEmpty!22666 (= mapRes!22666 (and tp!43774 e!450239))))

(declare-fun mapRest!22666 () (Array (_ BitVec 32) ValueCell!6615))

(declare-fun mapKey!22666 () (_ BitVec 32))

(declare-fun mapValue!22666 () ValueCell!6615)

(assert (=> mapNonEmpty!22666 (= (arr!21233 _values!788) (store mapRest!22666 mapKey!22666 mapValue!22666))))

(declare-fun b!812741 () Bool)

(declare-fun res!555325 () Bool)

(assert (=> b!812741 (=> (not res!555325) (not e!450240))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812741 (= res!555325 (and (= (size!21654 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21653 _keys!976) (size!21654 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69908 res!555327) b!812741))

(assert (= (and b!812741 res!555325) b!812738))

(assert (= (and b!812738 res!555326) b!812737))

(assert (= (and b!812736 condMapEmpty!22666) mapIsEmpty!22666))

(assert (= (and b!812736 (not condMapEmpty!22666)) mapNonEmpty!22666))

(get-info :version)

(assert (= (and mapNonEmpty!22666 ((_ is ValueCellFull!6615) mapValue!22666)) b!812740))

(assert (= (and b!812736 ((_ is ValueCellFull!6615) mapDefault!22666)) b!812739))

(assert (= start!69908 b!812736))

(declare-fun m!755025 () Bool)

(assert (=> start!69908 m!755025))

(declare-fun m!755027 () Bool)

(assert (=> start!69908 m!755027))

(declare-fun m!755029 () Bool)

(assert (=> start!69908 m!755029))

(declare-fun m!755031 () Bool)

(assert (=> b!812737 m!755031))

(declare-fun m!755033 () Bool)

(assert (=> b!812738 m!755033))

(declare-fun m!755035 () Bool)

(assert (=> mapNonEmpty!22666 m!755035))

(check-sat (not mapNonEmpty!22666) tp_is_empty!14061 (not b!812737) (not b!812738) (not start!69908))
(check-sat)
