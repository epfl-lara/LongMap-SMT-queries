; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40888 () Bool)

(assert start!40888)

(declare-fun b_free!10837 () Bool)

(declare-fun b_next!10837 () Bool)

(assert (=> start!40888 (= b_free!10837 (not b_next!10837))))

(declare-fun tp!38337 () Bool)

(declare-fun b_and!18953 () Bool)

(assert (=> start!40888 (= tp!38337 b_and!18953)))

(declare-fun b!454186 () Bool)

(declare-fun e!265712 () Bool)

(declare-fun tp_is_empty!12175 () Bool)

(assert (=> b!454186 (= e!265712 tp_is_empty!12175)))

(declare-fun b!454187 () Bool)

(declare-fun res!270651 () Bool)

(declare-fun e!265714 () Bool)

(assert (=> b!454187 (=> (not res!270651) (not e!265714))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454187 (= res!270651 (validKeyInArray!0 k0!794))))

(declare-fun b!454188 () Bool)

(declare-fun res!270654 () Bool)

(declare-fun e!265716 () Bool)

(assert (=> b!454188 (=> (not res!270654) (not e!265716))))

(declare-datatypes ((array!28147 0))(
  ( (array!28148 (arr!13517 (Array (_ BitVec 32) (_ BitVec 64))) (size!13870 (_ BitVec 32))) )
))
(declare-fun lt!205906 () array!28147)

(declare-datatypes ((List!8149 0))(
  ( (Nil!8146) (Cons!8145 (h!9001 (_ BitVec 64)) (t!13968 List!8149)) )
))
(declare-fun arrayNoDuplicates!0 (array!28147 (_ BitVec 32) List!8149) Bool)

(assert (=> b!454188 (= res!270654 (arrayNoDuplicates!0 lt!205906 #b00000000000000000000000000000000 Nil!8146))))

(declare-fun b!454190 () Bool)

(declare-fun res!270660 () Bool)

(assert (=> b!454190 (=> (not res!270660) (not e!265714))))

(declare-fun _keys!709 () array!28147)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17339 0))(
  ( (V!17340 (val!6132 Int)) )
))
(declare-datatypes ((ValueCell!5744 0))(
  ( (ValueCellFull!5744 (v!8392 V!17339)) (EmptyCell!5744) )
))
(declare-datatypes ((array!28149 0))(
  ( (array!28150 (arr!13518 (Array (_ BitVec 32) ValueCell!5744)) (size!13871 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28149)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454190 (= res!270660 (and (= (size!13871 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13870 _keys!709) (size!13871 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454191 () Bool)

(declare-fun res!270656 () Bool)

(assert (=> b!454191 (=> (not res!270656) (not e!265714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454191 (= res!270656 (validMask!0 mask!1025))))

(declare-fun b!454192 () Bool)

(declare-fun e!265715 () Bool)

(declare-fun mapRes!19903 () Bool)

(assert (=> b!454192 (= e!265715 (and e!265712 mapRes!19903))))

(declare-fun condMapEmpty!19903 () Bool)

(declare-fun mapDefault!19903 () ValueCell!5744)

(assert (=> b!454192 (= condMapEmpty!19903 (= (arr!13518 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5744)) mapDefault!19903)))))

(declare-fun mapIsEmpty!19903 () Bool)

(assert (=> mapIsEmpty!19903 mapRes!19903))

(declare-fun b!454193 () Bool)

(declare-fun e!265717 () Bool)

(assert (=> b!454193 (= e!265717 tp_is_empty!12175)))

(declare-fun b!454194 () Bool)

(assert (=> b!454194 (= e!265714 e!265716)))

(declare-fun res!270652 () Bool)

(assert (=> b!454194 (=> (not res!270652) (not e!265716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28147 (_ BitVec 32)) Bool)

(assert (=> b!454194 (= res!270652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205906 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454194 (= lt!205906 (array!28148 (store (arr!13517 _keys!709) i!563 k0!794) (size!13870 _keys!709)))))

(declare-fun b!454195 () Bool)

(assert (=> b!454195 (= e!265716 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17339)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17339)

(declare-datatypes ((tuple2!8088 0))(
  ( (tuple2!8089 (_1!4055 (_ BitVec 64)) (_2!4055 V!17339)) )
))
(declare-datatypes ((List!8150 0))(
  ( (Nil!8147) (Cons!8146 (h!9002 tuple2!8088) (t!13969 List!8150)) )
))
(declare-datatypes ((ListLongMap!6991 0))(
  ( (ListLongMap!6992 (toList!3511 List!8150)) )
))
(declare-fun lt!205907 () ListLongMap!6991)

(declare-fun v!412 () V!17339)

(declare-fun getCurrentListMapNoExtraKeys!1706 (array!28147 array!28149 (_ BitVec 32) (_ BitVec 32) V!17339 V!17339 (_ BitVec 32) Int) ListLongMap!6991)

(assert (=> b!454195 (= lt!205907 (getCurrentListMapNoExtraKeys!1706 lt!205906 (array!28150 (store (arr!13518 _values!549) i!563 (ValueCellFull!5744 v!412)) (size!13871 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205905 () ListLongMap!6991)

(assert (=> b!454195 (= lt!205905 (getCurrentListMapNoExtraKeys!1706 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454196 () Bool)

(declare-fun res!270662 () Bool)

(assert (=> b!454196 (=> (not res!270662) (not e!265714))))

(assert (=> b!454196 (= res!270662 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13870 _keys!709))))))

(declare-fun res!270658 () Bool)

(assert (=> start!40888 (=> (not res!270658) (not e!265714))))

(assert (=> start!40888 (= res!270658 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13870 _keys!709))))))

(assert (=> start!40888 e!265714))

(assert (=> start!40888 tp_is_empty!12175))

(assert (=> start!40888 tp!38337))

(assert (=> start!40888 true))

(declare-fun array_inv!9848 (array!28149) Bool)

(assert (=> start!40888 (and (array_inv!9848 _values!549) e!265715)))

(declare-fun array_inv!9849 (array!28147) Bool)

(assert (=> start!40888 (array_inv!9849 _keys!709)))

(declare-fun b!454189 () Bool)

(declare-fun res!270659 () Bool)

(assert (=> b!454189 (=> (not res!270659) (not e!265714))))

(assert (=> b!454189 (= res!270659 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8146))))

(declare-fun mapNonEmpty!19903 () Bool)

(declare-fun tp!38338 () Bool)

(assert (=> mapNonEmpty!19903 (= mapRes!19903 (and tp!38338 e!265717))))

(declare-fun mapKey!19903 () (_ BitVec 32))

(declare-fun mapRest!19903 () (Array (_ BitVec 32) ValueCell!5744))

(declare-fun mapValue!19903 () ValueCell!5744)

(assert (=> mapNonEmpty!19903 (= (arr!13518 _values!549) (store mapRest!19903 mapKey!19903 mapValue!19903))))

(declare-fun b!454197 () Bool)

(declare-fun res!270653 () Bool)

(assert (=> b!454197 (=> (not res!270653) (not e!265714))))

(assert (=> b!454197 (= res!270653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454198 () Bool)

(declare-fun res!270661 () Bool)

(assert (=> b!454198 (=> (not res!270661) (not e!265716))))

(assert (=> b!454198 (= res!270661 (bvsle from!863 i!563))))

(declare-fun b!454199 () Bool)

(declare-fun res!270655 () Bool)

(assert (=> b!454199 (=> (not res!270655) (not e!265714))))

(assert (=> b!454199 (= res!270655 (or (= (select (arr!13517 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13517 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454200 () Bool)

(declare-fun res!270657 () Bool)

(assert (=> b!454200 (=> (not res!270657) (not e!265714))))

(declare-fun arrayContainsKey!0 (array!28147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454200 (= res!270657 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40888 res!270658) b!454191))

(assert (= (and b!454191 res!270656) b!454190))

(assert (= (and b!454190 res!270660) b!454197))

(assert (= (and b!454197 res!270653) b!454189))

(assert (= (and b!454189 res!270659) b!454196))

(assert (= (and b!454196 res!270662) b!454187))

(assert (= (and b!454187 res!270651) b!454199))

(assert (= (and b!454199 res!270655) b!454200))

(assert (= (and b!454200 res!270657) b!454194))

(assert (= (and b!454194 res!270652) b!454188))

(assert (= (and b!454188 res!270654) b!454198))

(assert (= (and b!454198 res!270661) b!454195))

(assert (= (and b!454192 condMapEmpty!19903) mapIsEmpty!19903))

(assert (= (and b!454192 (not condMapEmpty!19903)) mapNonEmpty!19903))

(get-info :version)

(assert (= (and mapNonEmpty!19903 ((_ is ValueCellFull!5744) mapValue!19903)) b!454193))

(assert (= (and b!454192 ((_ is ValueCellFull!5744) mapDefault!19903)) b!454186))

(assert (= start!40888 b!454192))

(declare-fun m!437837 () Bool)

(assert (=> mapNonEmpty!19903 m!437837))

(declare-fun m!437839 () Bool)

(assert (=> b!454199 m!437839))

(declare-fun m!437841 () Bool)

(assert (=> start!40888 m!437841))

(declare-fun m!437843 () Bool)

(assert (=> start!40888 m!437843))

(declare-fun m!437845 () Bool)

(assert (=> b!454189 m!437845))

(declare-fun m!437847 () Bool)

(assert (=> b!454195 m!437847))

(declare-fun m!437849 () Bool)

(assert (=> b!454195 m!437849))

(declare-fun m!437851 () Bool)

(assert (=> b!454195 m!437851))

(declare-fun m!437853 () Bool)

(assert (=> b!454200 m!437853))

(declare-fun m!437855 () Bool)

(assert (=> b!454191 m!437855))

(declare-fun m!437857 () Bool)

(assert (=> b!454194 m!437857))

(declare-fun m!437859 () Bool)

(assert (=> b!454194 m!437859))

(declare-fun m!437861 () Bool)

(assert (=> b!454187 m!437861))

(declare-fun m!437863 () Bool)

(assert (=> b!454188 m!437863))

(declare-fun m!437865 () Bool)

(assert (=> b!454197 m!437865))

(check-sat tp_is_empty!12175 (not b!454194) (not b!454195) (not b!454188) (not b_next!10837) (not b!454187) (not b!454200) (not mapNonEmpty!19903) (not start!40888) (not b!454197) b_and!18953 (not b!454191) (not b!454189))
(check-sat b_and!18953 (not b_next!10837))
