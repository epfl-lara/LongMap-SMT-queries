; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82388 () Bool)

(assert start!82388)

(declare-fun b_free!18493 () Bool)

(declare-fun b_next!18493 () Bool)

(assert (=> start!82388 (= b_free!18493 (not b_next!18493))))

(declare-fun tp!64440 () Bool)

(declare-fun b_and!29991 () Bool)

(assert (=> start!82388 (= tp!64440 b_and!29991)))

(declare-fun res!641823 () Bool)

(declare-fun e!540850 () Bool)

(assert (=> start!82388 (=> (not res!641823) (not e!540850))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82388 (= res!641823 (validMask!0 mask!2088))))

(assert (=> start!82388 e!540850))

(assert (=> start!82388 true))

(declare-fun tp_is_empty!21199 () Bool)

(assert (=> start!82388 tp_is_empty!21199))

(declare-datatypes ((array!58528 0))(
  ( (array!58529 (arr!28133 (Array (_ BitVec 32) (_ BitVec 64))) (size!28613 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58528)

(declare-fun array_inv!21895 (array!58528) Bool)

(assert (=> start!82388 (array_inv!21895 _keys!1668)))

(declare-datatypes ((V!33249 0))(
  ( (V!33250 (val!10650 Int)) )
))
(declare-datatypes ((ValueCell!10118 0))(
  ( (ValueCellFull!10118 (v!13204 V!33249)) (EmptyCell!10118) )
))
(declare-datatypes ((array!58530 0))(
  ( (array!58531 (arr!28134 (Array (_ BitVec 32) ValueCell!10118)) (size!28614 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58530)

(declare-fun e!540848 () Bool)

(declare-fun array_inv!21896 (array!58530) Bool)

(assert (=> start!82388 (and (array_inv!21896 _values!1386) e!540848)))

(assert (=> start!82388 tp!64440))

(declare-fun b!959237 () Bool)

(declare-fun res!641819 () Bool)

(assert (=> b!959237 (=> (not res!641819) (not e!540850))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959237 (= res!641819 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28613 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28613 _keys!1668))))))

(declare-fun b!959238 () Bool)

(declare-fun res!641820 () Bool)

(assert (=> b!959238 (=> (not res!641820) (not e!540850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58528 (_ BitVec 32)) Bool)

(assert (=> b!959238 (= res!641820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959239 () Bool)

(declare-fun e!540852 () Bool)

(declare-fun mapRes!33778 () Bool)

(assert (=> b!959239 (= e!540848 (and e!540852 mapRes!33778))))

(declare-fun condMapEmpty!33778 () Bool)

(declare-fun mapDefault!33778 () ValueCell!10118)

(assert (=> b!959239 (= condMapEmpty!33778 (= (arr!28134 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10118)) mapDefault!33778)))))

(declare-fun b!959240 () Bool)

(declare-fun res!641822 () Bool)

(assert (=> b!959240 (=> (not res!641822) (not e!540850))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959240 (= res!641822 (and (= (size!28614 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28613 _keys!1668) (size!28614 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959241 () Bool)

(declare-fun e!540849 () Bool)

(assert (=> b!959241 (= e!540849 tp_is_empty!21199)))

(declare-fun b!959242 () Bool)

(assert (=> b!959242 (= e!540850 false)))

(declare-fun minValue!1328 () V!33249)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33249)

(declare-fun lt!430792 () Bool)

(declare-datatypes ((tuple2!13714 0))(
  ( (tuple2!13715 (_1!6868 (_ BitVec 64)) (_2!6868 V!33249)) )
))
(declare-datatypes ((List!19546 0))(
  ( (Nil!19543) (Cons!19542 (h!20710 tuple2!13714) (t!27901 List!19546)) )
))
(declare-datatypes ((ListLongMap!12413 0))(
  ( (ListLongMap!12414 (toList!6222 List!19546)) )
))
(declare-fun contains!5336 (ListLongMap!12413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3455 (array!58528 array!58530 (_ BitVec 32) (_ BitVec 32) V!33249 V!33249 (_ BitVec 32) Int) ListLongMap!12413)

(assert (=> b!959242 (= lt!430792 (contains!5336 (getCurrentListMap!3455 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28133 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33778 () Bool)

(assert (=> mapIsEmpty!33778 mapRes!33778))

(declare-fun b!959243 () Bool)

(assert (=> b!959243 (= e!540852 tp_is_empty!21199)))

(declare-fun mapNonEmpty!33778 () Bool)

(declare-fun tp!64441 () Bool)

(assert (=> mapNonEmpty!33778 (= mapRes!33778 (and tp!64441 e!540849))))

(declare-fun mapValue!33778 () ValueCell!10118)

(declare-fun mapKey!33778 () (_ BitVec 32))

(declare-fun mapRest!33778 () (Array (_ BitVec 32) ValueCell!10118))

(assert (=> mapNonEmpty!33778 (= (arr!28134 _values!1386) (store mapRest!33778 mapKey!33778 mapValue!33778))))

(declare-fun b!959244 () Bool)

(declare-fun res!641824 () Bool)

(assert (=> b!959244 (=> (not res!641824) (not e!540850))))

(declare-datatypes ((List!19547 0))(
  ( (Nil!19544) (Cons!19543 (h!20711 (_ BitVec 64)) (t!27902 List!19547)) )
))
(declare-fun arrayNoDuplicates!0 (array!58528 (_ BitVec 32) List!19547) Bool)

(assert (=> b!959244 (= res!641824 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19544))))

(declare-fun b!959245 () Bool)

(declare-fun res!641821 () Bool)

(assert (=> b!959245 (=> (not res!641821) (not e!540850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959245 (= res!641821 (validKeyInArray!0 (select (arr!28133 _keys!1668) i!793)))))

(assert (= (and start!82388 res!641823) b!959240))

(assert (= (and b!959240 res!641822) b!959238))

(assert (= (and b!959238 res!641820) b!959244))

(assert (= (and b!959244 res!641824) b!959237))

(assert (= (and b!959237 res!641819) b!959245))

(assert (= (and b!959245 res!641821) b!959242))

(assert (= (and b!959239 condMapEmpty!33778) mapIsEmpty!33778))

(assert (= (and b!959239 (not condMapEmpty!33778)) mapNonEmpty!33778))

(get-info :version)

(assert (= (and mapNonEmpty!33778 ((_ is ValueCellFull!10118) mapValue!33778)) b!959241))

(assert (= (and b!959239 ((_ is ValueCellFull!10118) mapDefault!33778)) b!959243))

(assert (= start!82388 b!959239))

(declare-fun m!890331 () Bool)

(assert (=> start!82388 m!890331))

(declare-fun m!890333 () Bool)

(assert (=> start!82388 m!890333))

(declare-fun m!890335 () Bool)

(assert (=> start!82388 m!890335))

(declare-fun m!890337 () Bool)

(assert (=> b!959238 m!890337))

(declare-fun m!890339 () Bool)

(assert (=> b!959242 m!890339))

(declare-fun m!890341 () Bool)

(assert (=> b!959242 m!890341))

(assert (=> b!959242 m!890339))

(assert (=> b!959242 m!890341))

(declare-fun m!890343 () Bool)

(assert (=> b!959242 m!890343))

(declare-fun m!890345 () Bool)

(assert (=> mapNonEmpty!33778 m!890345))

(assert (=> b!959245 m!890341))

(assert (=> b!959245 m!890341))

(declare-fun m!890347 () Bool)

(assert (=> b!959245 m!890347))

(declare-fun m!890349 () Bool)

(assert (=> b!959244 m!890349))

(check-sat b_and!29991 (not b!959238) (not b!959244) (not mapNonEmpty!33778) (not b!959242) (not start!82388) tp_is_empty!21199 (not b_next!18493) (not b!959245))
(check-sat b_and!29991 (not b_next!18493))
