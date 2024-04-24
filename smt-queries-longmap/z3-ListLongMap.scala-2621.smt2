; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39530 () Bool)

(assert start!39530)

(declare-fun b_free!9811 () Bool)

(declare-fun b_next!9811 () Bool)

(assert (=> start!39530 (= b_free!9811 (not b_next!9811))))

(declare-fun tp!34962 () Bool)

(declare-fun b_and!17481 () Bool)

(assert (=> start!39530 (= tp!34962 b_and!17481)))

(declare-fun b!422945 () Bool)

(declare-fun res!247117 () Bool)

(declare-fun e!251526 () Bool)

(assert (=> b!422945 (=> (not res!247117) (not e!251526))))

(declare-datatypes ((array!25780 0))(
  ( (array!25781 (arr!12339 (Array (_ BitVec 32) (_ BitVec 64))) (size!12691 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25780)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422945 (= res!247117 (or (= (select (arr!12339 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12339 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422946 () Bool)

(declare-fun e!251529 () Bool)

(declare-fun tp_is_empty!10963 () Bool)

(assert (=> b!422946 (= e!251529 tp_is_empty!10963)))

(declare-fun b!422947 () Bool)

(declare-fun res!247128 () Bool)

(declare-fun e!251525 () Bool)

(assert (=> b!422947 (=> (not res!247128) (not e!251525))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422947 (= res!247128 (bvsle from!863 i!563))))

(declare-fun b!422948 () Bool)

(declare-fun e!251528 () Bool)

(declare-fun e!251527 () Bool)

(declare-fun mapRes!18066 () Bool)

(assert (=> b!422948 (= e!251528 (and e!251527 mapRes!18066))))

(declare-fun condMapEmpty!18066 () Bool)

(declare-datatypes ((V!15723 0))(
  ( (V!15724 (val!5526 Int)) )
))
(declare-datatypes ((ValueCell!5138 0))(
  ( (ValueCellFull!5138 (v!7774 V!15723)) (EmptyCell!5138) )
))
(declare-datatypes ((array!25782 0))(
  ( (array!25783 (arr!12340 (Array (_ BitVec 32) ValueCell!5138)) (size!12692 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25782)

(declare-fun mapDefault!18066 () ValueCell!5138)

(assert (=> b!422948 (= condMapEmpty!18066 (= (arr!12340 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5138)) mapDefault!18066)))))

(declare-fun b!422949 () Bool)

(declare-fun res!247123 () Bool)

(assert (=> b!422949 (=> (not res!247123) (not e!251526))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422949 (= res!247123 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18066 () Bool)

(assert (=> mapIsEmpty!18066 mapRes!18066))

(declare-fun b!422950 () Bool)

(assert (=> b!422950 (= e!251525 false)))

(declare-fun minValue!515 () V!15723)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15723)

(declare-fun v!412 () V!15723)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!194099 () array!25780)

(declare-datatypes ((tuple2!7142 0))(
  ( (tuple2!7143 (_1!3582 (_ BitVec 64)) (_2!3582 V!15723)) )
))
(declare-datatypes ((List!7144 0))(
  ( (Nil!7141) (Cons!7140 (h!7996 tuple2!7142) (t!12580 List!7144)) )
))
(declare-datatypes ((ListLongMap!6057 0))(
  ( (ListLongMap!6058 (toList!3044 List!7144)) )
))
(declare-fun lt!194100 () ListLongMap!6057)

(declare-fun getCurrentListMapNoExtraKeys!1290 (array!25780 array!25782 (_ BitVec 32) (_ BitVec 32) V!15723 V!15723 (_ BitVec 32) Int) ListLongMap!6057)

(assert (=> b!422950 (= lt!194100 (getCurrentListMapNoExtraKeys!1290 lt!194099 (array!25783 (store (arr!12340 _values!549) i!563 (ValueCellFull!5138 v!412)) (size!12692 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194098 () ListLongMap!6057)

(assert (=> b!422950 (= lt!194098 (getCurrentListMapNoExtraKeys!1290 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!247120 () Bool)

(assert (=> start!39530 (=> (not res!247120) (not e!251526))))

(assert (=> start!39530 (= res!247120 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12691 _keys!709))))))

(assert (=> start!39530 e!251526))

(assert (=> start!39530 tp_is_empty!10963))

(assert (=> start!39530 tp!34962))

(assert (=> start!39530 true))

(declare-fun array_inv!9068 (array!25782) Bool)

(assert (=> start!39530 (and (array_inv!9068 _values!549) e!251528)))

(declare-fun array_inv!9069 (array!25780) Bool)

(assert (=> start!39530 (array_inv!9069 _keys!709)))

(declare-fun b!422951 () Bool)

(assert (=> b!422951 (= e!251526 e!251525)))

(declare-fun res!247118 () Bool)

(assert (=> b!422951 (=> (not res!247118) (not e!251525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25780 (_ BitVec 32)) Bool)

(assert (=> b!422951 (= res!247118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194099 mask!1025))))

(assert (=> b!422951 (= lt!194099 (array!25781 (store (arr!12339 _keys!709) i!563 k0!794) (size!12691 _keys!709)))))

(declare-fun b!422952 () Bool)

(assert (=> b!422952 (= e!251527 tp_is_empty!10963)))

(declare-fun b!422953 () Bool)

(declare-fun res!247121 () Bool)

(assert (=> b!422953 (=> (not res!247121) (not e!251526))))

(assert (=> b!422953 (= res!247121 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12691 _keys!709))))))

(declare-fun mapNonEmpty!18066 () Bool)

(declare-fun tp!34961 () Bool)

(assert (=> mapNonEmpty!18066 (= mapRes!18066 (and tp!34961 e!251529))))

(declare-fun mapKey!18066 () (_ BitVec 32))

(declare-fun mapRest!18066 () (Array (_ BitVec 32) ValueCell!5138))

(declare-fun mapValue!18066 () ValueCell!5138)

(assert (=> mapNonEmpty!18066 (= (arr!12340 _values!549) (store mapRest!18066 mapKey!18066 mapValue!18066))))

(declare-fun b!422954 () Bool)

(declare-fun res!247125 () Bool)

(assert (=> b!422954 (=> (not res!247125) (not e!251525))))

(declare-datatypes ((List!7145 0))(
  ( (Nil!7142) (Cons!7141 (h!7997 (_ BitVec 64)) (t!12581 List!7145)) )
))
(declare-fun arrayNoDuplicates!0 (array!25780 (_ BitVec 32) List!7145) Bool)

(assert (=> b!422954 (= res!247125 (arrayNoDuplicates!0 lt!194099 #b00000000000000000000000000000000 Nil!7142))))

(declare-fun b!422955 () Bool)

(declare-fun res!247126 () Bool)

(assert (=> b!422955 (=> (not res!247126) (not e!251526))))

(assert (=> b!422955 (= res!247126 (and (= (size!12692 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12691 _keys!709) (size!12692 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422956 () Bool)

(declare-fun res!247127 () Bool)

(assert (=> b!422956 (=> (not res!247127) (not e!251526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422956 (= res!247127 (validMask!0 mask!1025))))

(declare-fun b!422957 () Bool)

(declare-fun res!247122 () Bool)

(assert (=> b!422957 (=> (not res!247122) (not e!251526))))

(declare-fun arrayContainsKey!0 (array!25780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422957 (= res!247122 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422958 () Bool)

(declare-fun res!247124 () Bool)

(assert (=> b!422958 (=> (not res!247124) (not e!251526))))

(assert (=> b!422958 (= res!247124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422959 () Bool)

(declare-fun res!247119 () Bool)

(assert (=> b!422959 (=> (not res!247119) (not e!251526))))

(assert (=> b!422959 (= res!247119 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7142))))

(assert (= (and start!39530 res!247120) b!422956))

(assert (= (and b!422956 res!247127) b!422955))

(assert (= (and b!422955 res!247126) b!422958))

(assert (= (and b!422958 res!247124) b!422959))

(assert (= (and b!422959 res!247119) b!422953))

(assert (= (and b!422953 res!247121) b!422949))

(assert (= (and b!422949 res!247123) b!422945))

(assert (= (and b!422945 res!247117) b!422957))

(assert (= (and b!422957 res!247122) b!422951))

(assert (= (and b!422951 res!247118) b!422954))

(assert (= (and b!422954 res!247125) b!422947))

(assert (= (and b!422947 res!247128) b!422950))

(assert (= (and b!422948 condMapEmpty!18066) mapIsEmpty!18066))

(assert (= (and b!422948 (not condMapEmpty!18066)) mapNonEmpty!18066))

(get-info :version)

(assert (= (and mapNonEmpty!18066 ((_ is ValueCellFull!5138) mapValue!18066)) b!422946))

(assert (= (and b!422948 ((_ is ValueCellFull!5138) mapDefault!18066)) b!422952))

(assert (= start!39530 b!422948))

(declare-fun m!412841 () Bool)

(assert (=> mapNonEmpty!18066 m!412841))

(declare-fun m!412843 () Bool)

(assert (=> b!422959 m!412843))

(declare-fun m!412845 () Bool)

(assert (=> b!422956 m!412845))

(declare-fun m!412847 () Bool)

(assert (=> b!422958 m!412847))

(declare-fun m!412849 () Bool)

(assert (=> start!39530 m!412849))

(declare-fun m!412851 () Bool)

(assert (=> start!39530 m!412851))

(declare-fun m!412853 () Bool)

(assert (=> b!422957 m!412853))

(declare-fun m!412855 () Bool)

(assert (=> b!422954 m!412855))

(declare-fun m!412857 () Bool)

(assert (=> b!422945 m!412857))

(declare-fun m!412859 () Bool)

(assert (=> b!422950 m!412859))

(declare-fun m!412861 () Bool)

(assert (=> b!422950 m!412861))

(declare-fun m!412863 () Bool)

(assert (=> b!422950 m!412863))

(declare-fun m!412865 () Bool)

(assert (=> b!422949 m!412865))

(declare-fun m!412867 () Bool)

(assert (=> b!422951 m!412867))

(declare-fun m!412869 () Bool)

(assert (=> b!422951 m!412869))

(check-sat (not b!422949) (not mapNonEmpty!18066) (not b!422956) (not b!422958) (not b!422959) (not b!422951) (not b!422957) (not b!422950) b_and!17481 (not start!39530) (not b_next!9811) (not b!422954) tp_is_empty!10963)
(check-sat b_and!17481 (not b_next!9811))
