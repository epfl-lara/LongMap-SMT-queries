; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82292 () Bool)

(assert start!82292)

(declare-fun b!959387 () Bool)

(declare-fun res!642255 () Bool)

(declare-fun e!540796 () Bool)

(assert (=> b!959387 (=> (not res!642255) (not e!540796))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58606 0))(
  ( (array!58607 (arr!28177 (Array (_ BitVec 32) (_ BitVec 64))) (size!28658 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58606)

(declare-datatypes ((V!33369 0))(
  ( (V!33370 (val!10695 Int)) )
))
(declare-datatypes ((ValueCell!10163 0))(
  ( (ValueCellFull!10163 (v!13251 V!33369)) (EmptyCell!10163) )
))
(declare-datatypes ((array!58608 0))(
  ( (array!58609 (arr!28178 (Array (_ BitVec 32) ValueCell!10163)) (size!28659 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58608)

(assert (=> b!959387 (= res!642255 (and (= (size!28659 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28658 _keys!1668) (size!28659 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33913 () Bool)

(declare-fun mapRes!33913 () Bool)

(assert (=> mapIsEmpty!33913 mapRes!33913))

(declare-fun b!959388 () Bool)

(declare-fun e!540794 () Bool)

(declare-fun e!540795 () Bool)

(assert (=> b!959388 (= e!540794 (and e!540795 mapRes!33913))))

(declare-fun condMapEmpty!33913 () Bool)

(declare-fun mapDefault!33913 () ValueCell!10163)

(assert (=> b!959388 (= condMapEmpty!33913 (= (arr!28178 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10163)) mapDefault!33913)))))

(declare-fun b!959389 () Bool)

(declare-fun res!642252 () Bool)

(assert (=> b!959389 (=> (not res!642252) (not e!540796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58606 (_ BitVec 32)) Bool)

(assert (=> b!959389 (= res!642252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959391 () Bool)

(declare-fun res!642253 () Bool)

(assert (=> b!959391 (=> (not res!642253) (not e!540796))))

(declare-datatypes ((List!19625 0))(
  ( (Nil!19622) (Cons!19621 (h!20783 (_ BitVec 64)) (t!27979 List!19625)) )
))
(declare-fun arrayNoDuplicates!0 (array!58606 (_ BitVec 32) List!19625) Bool)

(assert (=> b!959391 (= res!642253 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19622))))

(declare-fun b!959392 () Bool)

(declare-fun tp_is_empty!21289 () Bool)

(assert (=> b!959392 (= e!540795 tp_is_empty!21289)))

(declare-fun b!959393 () Bool)

(declare-fun e!540793 () Bool)

(assert (=> b!959393 (= e!540793 tp_is_empty!21289)))

(declare-fun mapNonEmpty!33913 () Bool)

(declare-fun tp!64708 () Bool)

(assert (=> mapNonEmpty!33913 (= mapRes!33913 (and tp!64708 e!540793))))

(declare-fun mapKey!33913 () (_ BitVec 32))

(declare-fun mapValue!33913 () ValueCell!10163)

(declare-fun mapRest!33913 () (Array (_ BitVec 32) ValueCell!10163))

(assert (=> mapNonEmpty!33913 (= (arr!28178 _values!1386) (store mapRest!33913 mapKey!33913 mapValue!33913))))

(declare-fun b!959390 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959390 (= e!540796 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28658 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28658 _keys!1668)) (bvslt i!793 #b00000000000000000000000000000000)))))

(declare-fun res!642254 () Bool)

(assert (=> start!82292 (=> (not res!642254) (not e!540796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82292 (= res!642254 (validMask!0 mask!2088))))

(assert (=> start!82292 e!540796))

(assert (=> start!82292 true))

(declare-fun array_inv!21899 (array!58606) Bool)

(assert (=> start!82292 (array_inv!21899 _keys!1668)))

(declare-fun array_inv!21900 (array!58608) Bool)

(assert (=> start!82292 (and (array_inv!21900 _values!1386) e!540794)))

(assert (= (and start!82292 res!642254) b!959387))

(assert (= (and b!959387 res!642255) b!959389))

(assert (= (and b!959389 res!642252) b!959391))

(assert (= (and b!959391 res!642253) b!959390))

(assert (= (and b!959388 condMapEmpty!33913) mapIsEmpty!33913))

(assert (= (and b!959388 (not condMapEmpty!33913)) mapNonEmpty!33913))

(get-info :version)

(assert (= (and mapNonEmpty!33913 ((_ is ValueCellFull!10163) mapValue!33913)) b!959393))

(assert (= (and b!959388 ((_ is ValueCellFull!10163) mapDefault!33913)) b!959392))

(assert (= start!82292 b!959388))

(declare-fun m!889341 () Bool)

(assert (=> b!959389 m!889341))

(declare-fun m!889343 () Bool)

(assert (=> b!959391 m!889343))

(declare-fun m!889345 () Bool)

(assert (=> mapNonEmpty!33913 m!889345))

(declare-fun m!889347 () Bool)

(assert (=> start!82292 m!889347))

(declare-fun m!889349 () Bool)

(assert (=> start!82292 m!889349))

(declare-fun m!889351 () Bool)

(assert (=> start!82292 m!889351))

(check-sat (not b!959391) (not b!959389) tp_is_empty!21289 (not start!82292) (not mapNonEmpty!33913))
(check-sat)
