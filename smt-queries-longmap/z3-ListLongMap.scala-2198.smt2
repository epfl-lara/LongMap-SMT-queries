; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36532 () Bool)

(assert start!36532)

(declare-fun mapNonEmpty!14175 () Bool)

(declare-fun mapRes!14175 () Bool)

(declare-fun tp!28251 () Bool)

(declare-fun e!223464 () Bool)

(assert (=> mapNonEmpty!14175 (= mapRes!14175 (and tp!28251 e!223464))))

(declare-datatypes ((V!12339 0))(
  ( (V!12340 (val!4257 Int)) )
))
(declare-datatypes ((ValueCell!3869 0))(
  ( (ValueCellFull!3869 (v!6453 V!12339)) (EmptyCell!3869) )
))
(declare-datatypes ((array!20786 0))(
  ( (array!20787 (arr!9870 (Array (_ BitVec 32) ValueCell!3869)) (size!10222 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20786)

(declare-fun mapValue!14175 () ValueCell!3869)

(declare-fun mapRest!14175 () (Array (_ BitVec 32) ValueCell!3869))

(declare-fun mapKey!14175 () (_ BitVec 32))

(assert (=> mapNonEmpty!14175 (= (arr!9870 _values!506) (store mapRest!14175 mapKey!14175 mapValue!14175))))

(declare-fun b!365074 () Bool)

(declare-fun tp_is_empty!8425 () Bool)

(assert (=> b!365074 (= e!223464 tp_is_empty!8425)))

(declare-fun b!365075 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun e!223462 () Bool)

(declare-datatypes ((array!20788 0))(
  ( (array!20789 (arr!9871 (Array (_ BitVec 32) (_ BitVec 64))) (size!10223 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20788)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365075 (= e!223462 (and (= (size!10222 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10223 _keys!658) (size!10222 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (not (= (size!10223 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)))))))

(declare-fun b!365076 () Bool)

(declare-fun e!223466 () Bool)

(declare-fun e!223463 () Bool)

(assert (=> b!365076 (= e!223466 (and e!223463 mapRes!14175))))

(declare-fun condMapEmpty!14175 () Bool)

(declare-fun mapDefault!14175 () ValueCell!3869)

(assert (=> b!365076 (= condMapEmpty!14175 (= (arr!9870 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3869)) mapDefault!14175)))))

(declare-fun mapIsEmpty!14175 () Bool)

(assert (=> mapIsEmpty!14175 mapRes!14175))

(declare-fun res!204178 () Bool)

(assert (=> start!36532 (=> (not res!204178) (not e!223462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36532 (= res!204178 (validMask!0 mask!970))))

(assert (=> start!36532 e!223462))

(assert (=> start!36532 true))

(declare-fun array_inv!7342 (array!20786) Bool)

(assert (=> start!36532 (and (array_inv!7342 _values!506) e!223466)))

(declare-fun array_inv!7343 (array!20788) Bool)

(assert (=> start!36532 (array_inv!7343 _keys!658)))

(declare-fun b!365073 () Bool)

(assert (=> b!365073 (= e!223463 tp_is_empty!8425)))

(assert (= (and start!36532 res!204178) b!365075))

(assert (= (and b!365076 condMapEmpty!14175) mapIsEmpty!14175))

(assert (= (and b!365076 (not condMapEmpty!14175)) mapNonEmpty!14175))

(get-info :version)

(assert (= (and mapNonEmpty!14175 ((_ is ValueCellFull!3869) mapValue!14175)) b!365074))

(assert (= (and b!365076 ((_ is ValueCellFull!3869) mapDefault!14175)) b!365073))

(assert (= start!36532 b!365076))

(declare-fun m!363193 () Bool)

(assert (=> mapNonEmpty!14175 m!363193))

(declare-fun m!363195 () Bool)

(assert (=> start!36532 m!363195))

(declare-fun m!363197 () Bool)

(assert (=> start!36532 m!363197))

(declare-fun m!363199 () Bool)

(assert (=> start!36532 m!363199))

(check-sat (not start!36532) (not mapNonEmpty!14175) tp_is_empty!8425)
(check-sat)
