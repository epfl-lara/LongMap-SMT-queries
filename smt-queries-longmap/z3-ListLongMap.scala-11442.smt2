; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133452 () Bool)

(assert start!133452)

(declare-fun b!1560168 () Bool)

(declare-fun e!869343 () Bool)

(declare-fun tp_is_empty!38535 () Bool)

(assert (=> b!1560168 (= e!869343 tp_is_empty!38535)))

(declare-fun b!1560169 () Bool)

(declare-fun res!1066872 () Bool)

(declare-fun e!869344 () Bool)

(assert (=> b!1560169 (=> (not res!1066872) (not e!869344))))

(declare-datatypes ((V!59587 0))(
  ( (V!59588 (val!19351 Int)) )
))
(declare-datatypes ((tuple2!25030 0))(
  ( (tuple2!25031 (_1!12526 (_ BitVec 64)) (_2!12526 V!59587)) )
))
(declare-datatypes ((List!36383 0))(
  ( (Nil!36380) (Cons!36379 (h!37825 tuple2!25030) (t!51116 List!36383)) )
))
(declare-datatypes ((ListLongMap!22465 0))(
  ( (ListLongMap!22466 (toList!11248 List!36383)) )
))
(declare-fun contains!10238 (ListLongMap!22465 (_ BitVec 64)) Bool)

(assert (=> b!1560169 (= res!1066872 (not (contains!10238 (ListLongMap!22466 Nil!36380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59178 () Bool)

(declare-fun mapRes!59178 () Bool)

(assert (=> mapIsEmpty!59178 mapRes!59178))

(declare-fun res!1066874 () Bool)

(assert (=> start!133452 (=> (not res!1066874) (not e!869344))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133452 (= res!1066874 (validMask!0 mask!947))))

(assert (=> start!133452 e!869344))

(assert (=> start!133452 true))

(declare-datatypes ((array!103794 0))(
  ( (array!103795 (arr!50089 (Array (_ BitVec 32) (_ BitVec 64))) (size!50639 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103794)

(declare-fun array_inv!38935 (array!103794) Bool)

(assert (=> start!133452 (array_inv!38935 _keys!637)))

(declare-datatypes ((ValueCell!18237 0))(
  ( (ValueCellFull!18237 (v!22103 V!59587)) (EmptyCell!18237) )
))
(declare-datatypes ((array!103796 0))(
  ( (array!103797 (arr!50090 (Array (_ BitVec 32) ValueCell!18237)) (size!50640 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103796)

(declare-fun e!869342 () Bool)

(declare-fun array_inv!38936 (array!103796) Bool)

(assert (=> start!133452 (and (array_inv!38936 _values!487) e!869342)))

(declare-fun b!1560170 () Bool)

(assert (=> b!1560170 (= e!869344 false)))

(declare-fun lt!670959 () Bool)

(assert (=> b!1560170 (= lt!670959 (contains!10238 (ListLongMap!22466 Nil!36380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560171 () Bool)

(declare-fun res!1066871 () Bool)

(assert (=> b!1560171 (=> (not res!1066871) (not e!869344))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560171 (= res!1066871 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50639 _keys!637)) (bvsge from!782 (size!50639 _keys!637))))))

(declare-fun b!1560172 () Bool)

(declare-fun res!1066873 () Bool)

(assert (=> b!1560172 (=> (not res!1066873) (not e!869344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103794 (_ BitVec 32)) Bool)

(assert (=> b!1560172 (= res!1066873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59178 () Bool)

(declare-fun tp!112833 () Bool)

(declare-fun e!869341 () Bool)

(assert (=> mapNonEmpty!59178 (= mapRes!59178 (and tp!112833 e!869341))))

(declare-fun mapValue!59178 () ValueCell!18237)

(declare-fun mapRest!59178 () (Array (_ BitVec 32) ValueCell!18237))

(declare-fun mapKey!59178 () (_ BitVec 32))

(assert (=> mapNonEmpty!59178 (= (arr!50090 _values!487) (store mapRest!59178 mapKey!59178 mapValue!59178))))

(declare-fun b!1560173 () Bool)

(assert (=> b!1560173 (= e!869342 (and e!869343 mapRes!59178))))

(declare-fun condMapEmpty!59178 () Bool)

(declare-fun mapDefault!59178 () ValueCell!18237)

(assert (=> b!1560173 (= condMapEmpty!59178 (= (arr!50090 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18237)) mapDefault!59178)))))

(declare-fun b!1560174 () Bool)

(assert (=> b!1560174 (= e!869341 tp_is_empty!38535)))

(declare-fun b!1560175 () Bool)

(declare-fun res!1066870 () Bool)

(assert (=> b!1560175 (=> (not res!1066870) (not e!869344))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560175 (= res!1066870 (and (= (size!50640 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50639 _keys!637) (size!50640 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560176 () Bool)

(declare-fun res!1066875 () Bool)

(assert (=> b!1560176 (=> (not res!1066875) (not e!869344))))

(declare-datatypes ((List!36384 0))(
  ( (Nil!36381) (Cons!36380 (h!37826 (_ BitVec 64)) (t!51117 List!36384)) )
))
(declare-fun arrayNoDuplicates!0 (array!103794 (_ BitVec 32) List!36384) Bool)

(assert (=> b!1560176 (= res!1066875 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36381))))

(assert (= (and start!133452 res!1066874) b!1560175))

(assert (= (and b!1560175 res!1066870) b!1560172))

(assert (= (and b!1560172 res!1066873) b!1560176))

(assert (= (and b!1560176 res!1066875) b!1560171))

(assert (= (and b!1560171 res!1066871) b!1560169))

(assert (= (and b!1560169 res!1066872) b!1560170))

(assert (= (and b!1560173 condMapEmpty!59178) mapIsEmpty!59178))

(assert (= (and b!1560173 (not condMapEmpty!59178)) mapNonEmpty!59178))

(get-info :version)

(assert (= (and mapNonEmpty!59178 ((_ is ValueCellFull!18237) mapValue!59178)) b!1560174))

(assert (= (and b!1560173 ((_ is ValueCellFull!18237) mapDefault!59178)) b!1560168))

(assert (= start!133452 b!1560173))

(declare-fun m!1436117 () Bool)

(assert (=> mapNonEmpty!59178 m!1436117))

(declare-fun m!1436119 () Bool)

(assert (=> start!133452 m!1436119))

(declare-fun m!1436121 () Bool)

(assert (=> start!133452 m!1436121))

(declare-fun m!1436123 () Bool)

(assert (=> start!133452 m!1436123))

(declare-fun m!1436125 () Bool)

(assert (=> b!1560176 m!1436125))

(declare-fun m!1436127 () Bool)

(assert (=> b!1560169 m!1436127))

(declare-fun m!1436129 () Bool)

(assert (=> b!1560170 m!1436129))

(declare-fun m!1436131 () Bool)

(assert (=> b!1560172 m!1436131))

(check-sat (not b!1560169) (not mapNonEmpty!59178) (not b!1560172) (not start!133452) tp_is_empty!38535 (not b!1560170) (not b!1560176))
(check-sat)
