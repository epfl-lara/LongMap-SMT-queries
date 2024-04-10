; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39024 () Bool)

(assert start!39024)

(declare-fun res!236875 () Bool)

(declare-fun e!245492 () Bool)

(assert (=> start!39024 (=> (not res!236875) (not e!245492))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24759 0))(
  ( (array!24760 (arr!11829 (Array (_ BitVec 32) (_ BitVec 64))) (size!12181 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24759)

(assert (=> start!39024 (= res!236875 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12181 _keys!709))))))

(assert (=> start!39024 e!245492))

(assert (=> start!39024 true))

(declare-datatypes ((V!15029 0))(
  ( (V!15030 (val!5266 Int)) )
))
(declare-datatypes ((ValueCell!4878 0))(
  ( (ValueCellFull!4878 (v!7513 V!15029)) (EmptyCell!4878) )
))
(declare-datatypes ((array!24761 0))(
  ( (array!24762 (arr!11830 (Array (_ BitVec 32) ValueCell!4878)) (size!12182 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24761)

(declare-fun e!245494 () Bool)

(declare-fun array_inv!8632 (array!24761) Bool)

(assert (=> start!39024 (and (array_inv!8632 _values!549) e!245494)))

(declare-fun array_inv!8633 (array!24759) Bool)

(assert (=> start!39024 (array_inv!8633 _keys!709)))

(declare-fun b!409160 () Bool)

(declare-fun res!236874 () Bool)

(assert (=> b!409160 (=> (not res!236874) (not e!245492))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409160 (= res!236874 (validMask!0 mask!1025))))

(declare-fun b!409161 () Bool)

(declare-fun res!236877 () Bool)

(assert (=> b!409161 (=> (not res!236877) (not e!245492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24759 (_ BitVec 32)) Bool)

(assert (=> b!409161 (= res!236877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409162 () Bool)

(declare-fun e!245493 () Bool)

(declare-fun tp_is_empty!10443 () Bool)

(assert (=> b!409162 (= e!245493 tp_is_empty!10443)))

(declare-fun b!409163 () Bool)

(declare-fun res!236876 () Bool)

(assert (=> b!409163 (=> (not res!236876) (not e!245492))))

(declare-datatypes ((List!6847 0))(
  ( (Nil!6844) (Cons!6843 (h!7699 (_ BitVec 64)) (t!12021 List!6847)) )
))
(declare-fun arrayNoDuplicates!0 (array!24759 (_ BitVec 32) List!6847) Bool)

(assert (=> b!409163 (= res!236876 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6844))))

(declare-fun b!409164 () Bool)

(declare-fun e!245495 () Bool)

(assert (=> b!409164 (= e!245495 false)))

(declare-fun lt!188909 () Bool)

(declare-fun lt!188908 () array!24759)

(assert (=> b!409164 (= lt!188909 (arrayNoDuplicates!0 lt!188908 #b00000000000000000000000000000000 Nil!6844))))

(declare-fun b!409165 () Bool)

(declare-fun res!236872 () Bool)

(assert (=> b!409165 (=> (not res!236872) (not e!245492))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409165 (= res!236872 (validKeyInArray!0 k0!794))))

(declare-fun b!409166 () Bool)

(declare-fun res!236868 () Bool)

(assert (=> b!409166 (=> (not res!236868) (not e!245492))))

(declare-fun arrayContainsKey!0 (array!24759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409166 (= res!236868 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409167 () Bool)

(declare-fun e!245491 () Bool)

(declare-fun mapRes!17286 () Bool)

(assert (=> b!409167 (= e!245494 (and e!245491 mapRes!17286))))

(declare-fun condMapEmpty!17286 () Bool)

(declare-fun mapDefault!17286 () ValueCell!4878)

(assert (=> b!409167 (= condMapEmpty!17286 (= (arr!11830 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4878)) mapDefault!17286)))))

(declare-fun mapIsEmpty!17286 () Bool)

(assert (=> mapIsEmpty!17286 mapRes!17286))

(declare-fun b!409168 () Bool)

(declare-fun res!236871 () Bool)

(assert (=> b!409168 (=> (not res!236871) (not e!245492))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409168 (= res!236871 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12181 _keys!709))))))

(declare-fun mapNonEmpty!17286 () Bool)

(declare-fun tp!33405 () Bool)

(assert (=> mapNonEmpty!17286 (= mapRes!17286 (and tp!33405 e!245493))))

(declare-fun mapValue!17286 () ValueCell!4878)

(declare-fun mapRest!17286 () (Array (_ BitVec 32) ValueCell!4878))

(declare-fun mapKey!17286 () (_ BitVec 32))

(assert (=> mapNonEmpty!17286 (= (arr!11830 _values!549) (store mapRest!17286 mapKey!17286 mapValue!17286))))

(declare-fun b!409169 () Bool)

(assert (=> b!409169 (= e!245492 e!245495)))

(declare-fun res!236870 () Bool)

(assert (=> b!409169 (=> (not res!236870) (not e!245495))))

(assert (=> b!409169 (= res!236870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188908 mask!1025))))

(assert (=> b!409169 (= lt!188908 (array!24760 (store (arr!11829 _keys!709) i!563 k0!794) (size!12181 _keys!709)))))

(declare-fun b!409170 () Bool)

(declare-fun res!236873 () Bool)

(assert (=> b!409170 (=> (not res!236873) (not e!245492))))

(assert (=> b!409170 (= res!236873 (or (= (select (arr!11829 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11829 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409171 () Bool)

(assert (=> b!409171 (= e!245491 tp_is_empty!10443)))

(declare-fun b!409172 () Bool)

(declare-fun res!236869 () Bool)

(assert (=> b!409172 (=> (not res!236869) (not e!245492))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409172 (= res!236869 (and (= (size!12182 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12181 _keys!709) (size!12182 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39024 res!236875) b!409160))

(assert (= (and b!409160 res!236874) b!409172))

(assert (= (and b!409172 res!236869) b!409161))

(assert (= (and b!409161 res!236877) b!409163))

(assert (= (and b!409163 res!236876) b!409168))

(assert (= (and b!409168 res!236871) b!409165))

(assert (= (and b!409165 res!236872) b!409170))

(assert (= (and b!409170 res!236873) b!409166))

(assert (= (and b!409166 res!236868) b!409169))

(assert (= (and b!409169 res!236870) b!409164))

(assert (= (and b!409167 condMapEmpty!17286) mapIsEmpty!17286))

(assert (= (and b!409167 (not condMapEmpty!17286)) mapNonEmpty!17286))

(get-info :version)

(assert (= (and mapNonEmpty!17286 ((_ is ValueCellFull!4878) mapValue!17286)) b!409162))

(assert (= (and b!409167 ((_ is ValueCellFull!4878) mapDefault!17286)) b!409171))

(assert (= start!39024 b!409167))

(declare-fun m!400183 () Bool)

(assert (=> start!39024 m!400183))

(declare-fun m!400185 () Bool)

(assert (=> start!39024 m!400185))

(declare-fun m!400187 () Bool)

(assert (=> b!409160 m!400187))

(declare-fun m!400189 () Bool)

(assert (=> b!409169 m!400189))

(declare-fun m!400191 () Bool)

(assert (=> b!409169 m!400191))

(declare-fun m!400193 () Bool)

(assert (=> mapNonEmpty!17286 m!400193))

(declare-fun m!400195 () Bool)

(assert (=> b!409161 m!400195))

(declare-fun m!400197 () Bool)

(assert (=> b!409165 m!400197))

(declare-fun m!400199 () Bool)

(assert (=> b!409164 m!400199))

(declare-fun m!400201 () Bool)

(assert (=> b!409166 m!400201))

(declare-fun m!400203 () Bool)

(assert (=> b!409163 m!400203))

(declare-fun m!400205 () Bool)

(assert (=> b!409170 m!400205))

(check-sat (not b!409169) (not b!409165) (not b!409160) (not b!409163) (not b!409166) (not mapNonEmpty!17286) (not start!39024) (not b!409161) tp_is_empty!10443 (not b!409164))
(check-sat)
