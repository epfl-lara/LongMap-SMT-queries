; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39590 () Bool)

(assert start!39590)

(declare-fun b_free!9871 () Bool)

(declare-fun b_next!9871 () Bool)

(assert (=> start!39590 (= b_free!9871 (not b_next!9871))))

(declare-fun tp!35142 () Bool)

(declare-fun b_and!17501 () Bool)

(assert (=> start!39590 (= tp!35142 b_and!17501)))

(declare-fun b!424073 () Bool)

(declare-fun e!251925 () Bool)

(declare-fun tp_is_empty!11023 () Bool)

(assert (=> b!424073 (= e!251925 tp_is_empty!11023)))

(declare-fun b!424074 () Bool)

(declare-fun res!248075 () Bool)

(declare-fun e!251924 () Bool)

(assert (=> b!424074 (=> (not res!248075) (not e!251924))))

(declare-datatypes ((array!25875 0))(
  ( (array!25876 (arr!12387 (Array (_ BitVec 32) (_ BitVec 64))) (size!12740 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25875)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25875 (_ BitVec 32)) Bool)

(assert (=> b!424074 (= res!248075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424075 () Bool)

(declare-fun e!251923 () Bool)

(declare-fun mapRes!18156 () Bool)

(assert (=> b!424075 (= e!251923 (and e!251925 mapRes!18156))))

(declare-fun condMapEmpty!18156 () Bool)

(declare-datatypes ((V!15803 0))(
  ( (V!15804 (val!5556 Int)) )
))
(declare-datatypes ((ValueCell!5168 0))(
  ( (ValueCellFull!5168 (v!7797 V!15803)) (EmptyCell!5168) )
))
(declare-datatypes ((array!25877 0))(
  ( (array!25878 (arr!12388 (Array (_ BitVec 32) ValueCell!5168)) (size!12741 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25877)

(declare-fun mapDefault!18156 () ValueCell!5168)

(assert (=> b!424075 (= condMapEmpty!18156 (= (arr!12388 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5168)) mapDefault!18156)))))

(declare-fun b!424076 () Bool)

(declare-fun res!248074 () Bool)

(declare-fun e!251927 () Bool)

(assert (=> b!424076 (=> (not res!248074) (not e!251927))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424076 (= res!248074 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18156 () Bool)

(assert (=> mapIsEmpty!18156 mapRes!18156))

(declare-fun b!424077 () Bool)

(declare-fun res!248082 () Bool)

(assert (=> b!424077 (=> (not res!248082) (not e!251924))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424077 (= res!248082 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424078 () Bool)

(declare-fun res!248073 () Bool)

(assert (=> b!424078 (=> (not res!248073) (not e!251924))))

(assert (=> b!424078 (= res!248073 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12740 _keys!709))))))

(declare-fun b!424079 () Bool)

(declare-fun res!248078 () Bool)

(assert (=> b!424079 (=> (not res!248078) (not e!251924))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424079 (= res!248078 (and (= (size!12741 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12740 _keys!709) (size!12741 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424080 () Bool)

(declare-fun res!248080 () Bool)

(assert (=> b!424080 (=> (not res!248080) (not e!251924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424080 (= res!248080 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18156 () Bool)

(declare-fun tp!35141 () Bool)

(declare-fun e!251928 () Bool)

(assert (=> mapNonEmpty!18156 (= mapRes!18156 (and tp!35141 e!251928))))

(declare-fun mapKey!18156 () (_ BitVec 32))

(declare-fun mapValue!18156 () ValueCell!5168)

(declare-fun mapRest!18156 () (Array (_ BitVec 32) ValueCell!5168))

(assert (=> mapNonEmpty!18156 (= (arr!12388 _values!549) (store mapRest!18156 mapKey!18156 mapValue!18156))))

(declare-fun res!248081 () Bool)

(assert (=> start!39590 (=> (not res!248081) (not e!251924))))

(assert (=> start!39590 (= res!248081 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12740 _keys!709))))))

(assert (=> start!39590 e!251924))

(assert (=> start!39590 tp_is_empty!11023))

(assert (=> start!39590 tp!35142))

(assert (=> start!39590 true))

(declare-fun array_inv!9056 (array!25877) Bool)

(assert (=> start!39590 (and (array_inv!9056 _values!549) e!251923)))

(declare-fun array_inv!9057 (array!25875) Bool)

(assert (=> start!39590 (array_inv!9057 _keys!709)))

(declare-fun b!424081 () Bool)

(declare-fun res!248079 () Bool)

(assert (=> b!424081 (=> (not res!248079) (not e!251927))))

(declare-fun lt!194117 () array!25875)

(declare-datatypes ((List!7278 0))(
  ( (Nil!7275) (Cons!7274 (h!8130 (_ BitVec 64)) (t!12713 List!7278)) )
))
(declare-fun arrayNoDuplicates!0 (array!25875 (_ BitVec 32) List!7278) Bool)

(assert (=> b!424081 (= res!248079 (arrayNoDuplicates!0 lt!194117 #b00000000000000000000000000000000 Nil!7275))))

(declare-fun b!424082 () Bool)

(assert (=> b!424082 (= e!251927 false)))

(declare-fun minValue!515 () V!15803)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7282 0))(
  ( (tuple2!7283 (_1!3652 (_ BitVec 64)) (_2!3652 V!15803)) )
))
(declare-datatypes ((List!7279 0))(
  ( (Nil!7276) (Cons!7275 (h!8131 tuple2!7282) (t!12714 List!7279)) )
))
(declare-datatypes ((ListLongMap!6185 0))(
  ( (ListLongMap!6186 (toList!3108 List!7279)) )
))
(declare-fun lt!194116 () ListLongMap!6185)

(declare-fun zeroValue!515 () V!15803)

(declare-fun v!412 () V!15803)

(declare-fun getCurrentListMapNoExtraKeys!1316 (array!25875 array!25877 (_ BitVec 32) (_ BitVec 32) V!15803 V!15803 (_ BitVec 32) Int) ListLongMap!6185)

(assert (=> b!424082 (= lt!194116 (getCurrentListMapNoExtraKeys!1316 lt!194117 (array!25878 (store (arr!12388 _values!549) i!563 (ValueCellFull!5168 v!412)) (size!12741 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194115 () ListLongMap!6185)

(assert (=> b!424082 (= lt!194115 (getCurrentListMapNoExtraKeys!1316 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424083 () Bool)

(declare-fun res!248072 () Bool)

(assert (=> b!424083 (=> (not res!248072) (not e!251924))))

(assert (=> b!424083 (= res!248072 (or (= (select (arr!12387 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12387 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424084 () Bool)

(declare-fun res!248076 () Bool)

(assert (=> b!424084 (=> (not res!248076) (not e!251924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424084 (= res!248076 (validKeyInArray!0 k0!794))))

(declare-fun b!424085 () Bool)

(assert (=> b!424085 (= e!251924 e!251927)))

(declare-fun res!248077 () Bool)

(assert (=> b!424085 (=> (not res!248077) (not e!251927))))

(assert (=> b!424085 (= res!248077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194117 mask!1025))))

(assert (=> b!424085 (= lt!194117 (array!25876 (store (arr!12387 _keys!709) i!563 k0!794) (size!12740 _keys!709)))))

(declare-fun b!424086 () Bool)

(declare-fun res!248071 () Bool)

(assert (=> b!424086 (=> (not res!248071) (not e!251924))))

(assert (=> b!424086 (= res!248071 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7275))))

(declare-fun b!424087 () Bool)

(assert (=> b!424087 (= e!251928 tp_is_empty!11023)))

(assert (= (and start!39590 res!248081) b!424080))

(assert (= (and b!424080 res!248080) b!424079))

(assert (= (and b!424079 res!248078) b!424074))

(assert (= (and b!424074 res!248075) b!424086))

(assert (= (and b!424086 res!248071) b!424078))

(assert (= (and b!424078 res!248073) b!424084))

(assert (= (and b!424084 res!248076) b!424083))

(assert (= (and b!424083 res!248072) b!424077))

(assert (= (and b!424077 res!248082) b!424085))

(assert (= (and b!424085 res!248077) b!424081))

(assert (= (and b!424081 res!248079) b!424076))

(assert (= (and b!424076 res!248074) b!424082))

(assert (= (and b!424075 condMapEmpty!18156) mapIsEmpty!18156))

(assert (= (and b!424075 (not condMapEmpty!18156)) mapNonEmpty!18156))

(get-info :version)

(assert (= (and mapNonEmpty!18156 ((_ is ValueCellFull!5168) mapValue!18156)) b!424087))

(assert (= (and b!424075 ((_ is ValueCellFull!5168) mapDefault!18156)) b!424073))

(assert (= start!39590 b!424075))

(declare-fun m!412791 () Bool)

(assert (=> mapNonEmpty!18156 m!412791))

(declare-fun m!412793 () Bool)

(assert (=> b!424083 m!412793))

(declare-fun m!412795 () Bool)

(assert (=> b!424086 m!412795))

(declare-fun m!412797 () Bool)

(assert (=> b!424081 m!412797))

(declare-fun m!412799 () Bool)

(assert (=> b!424082 m!412799))

(declare-fun m!412801 () Bool)

(assert (=> b!424082 m!412801))

(declare-fun m!412803 () Bool)

(assert (=> b!424082 m!412803))

(declare-fun m!412805 () Bool)

(assert (=> b!424074 m!412805))

(declare-fun m!412807 () Bool)

(assert (=> b!424077 m!412807))

(declare-fun m!412809 () Bool)

(assert (=> b!424084 m!412809))

(declare-fun m!412811 () Bool)

(assert (=> start!39590 m!412811))

(declare-fun m!412813 () Bool)

(assert (=> start!39590 m!412813))

(declare-fun m!412815 () Bool)

(assert (=> b!424080 m!412815))

(declare-fun m!412817 () Bool)

(assert (=> b!424085 m!412817))

(declare-fun m!412819 () Bool)

(assert (=> b!424085 m!412819))

(check-sat (not b!424080) (not mapNonEmpty!18156) (not b!424077) (not b!424085) b_and!17501 (not b!424081) (not b!424086) (not b!424074) tp_is_empty!11023 (not start!39590) (not b!424084) (not b!424082) (not b_next!9871))
(check-sat b_and!17501 (not b_next!9871))
