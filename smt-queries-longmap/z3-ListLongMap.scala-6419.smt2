; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82478 () Bool)

(assert start!82478)

(declare-fun mapIsEmpty!33913 () Bool)

(declare-fun mapRes!33913 () Bool)

(assert (=> mapIsEmpty!33913 mapRes!33913))

(declare-fun b!960529 () Bool)

(declare-fun e!541524 () Bool)

(declare-fun e!541523 () Bool)

(assert (=> b!960529 (= e!541524 (and e!541523 mapRes!33913))))

(declare-fun condMapEmpty!33913 () Bool)

(declare-datatypes ((V!33369 0))(
  ( (V!33370 (val!10695 Int)) )
))
(declare-datatypes ((ValueCell!10163 0))(
  ( (ValueCellFull!10163 (v!13249 V!33369)) (EmptyCell!10163) )
))
(declare-datatypes ((array!58704 0))(
  ( (array!58705 (arr!28221 (Array (_ BitVec 32) ValueCell!10163)) (size!28701 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58704)

(declare-fun mapDefault!33913 () ValueCell!10163)

(assert (=> b!960529 (= condMapEmpty!33913 (= (arr!28221 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10163)) mapDefault!33913)))))

(declare-fun b!960530 () Bool)

(declare-fun res!642707 () Bool)

(declare-fun e!541527 () Bool)

(assert (=> b!960530 (=> (not res!642707) (not e!541527))))

(declare-datatypes ((array!58706 0))(
  ( (array!58707 (arr!28222 (Array (_ BitVec 32) (_ BitVec 64))) (size!28702 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58706)

(declare-datatypes ((List!19609 0))(
  ( (Nil!19606) (Cons!19605 (h!20773 (_ BitVec 64)) (t!27964 List!19609)) )
))
(declare-fun arrayNoDuplicates!0 (array!58706 (_ BitVec 32) List!19609) Bool)

(assert (=> b!960530 (= res!642707 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19606))))

(declare-fun b!960531 () Bool)

(declare-fun res!642709 () Bool)

(assert (=> b!960531 (=> (not res!642709) (not e!541527))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960531 (= res!642709 (and (= (size!28701 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28702 _keys!1668) (size!28701 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960532 () Bool)

(declare-fun res!642708 () Bool)

(assert (=> b!960532 (=> (not res!642708) (not e!541527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58706 (_ BitVec 32)) Bool)

(assert (=> b!960532 (= res!642708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960533 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960533 (= e!541527 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28702 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28702 _keys!1668)) (bvslt i!793 #b00000000000000000000000000000000)))))

(declare-fun b!960534 () Bool)

(declare-fun e!541525 () Bool)

(declare-fun tp_is_empty!21289 () Bool)

(assert (=> b!960534 (= e!541525 tp_is_empty!21289)))

(declare-fun b!960535 () Bool)

(assert (=> b!960535 (= e!541523 tp_is_empty!21289)))

(declare-fun res!642706 () Bool)

(assert (=> start!82478 (=> (not res!642706) (not e!541527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82478 (= res!642706 (validMask!0 mask!2088))))

(assert (=> start!82478 e!541527))

(assert (=> start!82478 true))

(declare-fun array_inv!21953 (array!58706) Bool)

(assert (=> start!82478 (array_inv!21953 _keys!1668)))

(declare-fun array_inv!21954 (array!58704) Bool)

(assert (=> start!82478 (and (array_inv!21954 _values!1386) e!541524)))

(declare-fun mapNonEmpty!33913 () Bool)

(declare-fun tp!64708 () Bool)

(assert (=> mapNonEmpty!33913 (= mapRes!33913 (and tp!64708 e!541525))))

(declare-fun mapKey!33913 () (_ BitVec 32))

(declare-fun mapRest!33913 () (Array (_ BitVec 32) ValueCell!10163))

(declare-fun mapValue!33913 () ValueCell!10163)

(assert (=> mapNonEmpty!33913 (= (arr!28221 _values!1386) (store mapRest!33913 mapKey!33913 mapValue!33913))))

(assert (= (and start!82478 res!642706) b!960531))

(assert (= (and b!960531 res!642709) b!960532))

(assert (= (and b!960532 res!642708) b!960530))

(assert (= (and b!960530 res!642707) b!960533))

(assert (= (and b!960529 condMapEmpty!33913) mapIsEmpty!33913))

(assert (= (and b!960529 (not condMapEmpty!33913)) mapNonEmpty!33913))

(get-info :version)

(assert (= (and mapNonEmpty!33913 ((_ is ValueCellFull!10163) mapValue!33913)) b!960534))

(assert (= (and b!960529 ((_ is ValueCellFull!10163) mapDefault!33913)) b!960535))

(assert (= start!82478 b!960529))

(declare-fun m!891393 () Bool)

(assert (=> b!960530 m!891393))

(declare-fun m!891395 () Bool)

(assert (=> b!960532 m!891395))

(declare-fun m!891397 () Bool)

(assert (=> start!82478 m!891397))

(declare-fun m!891399 () Bool)

(assert (=> start!82478 m!891399))

(declare-fun m!891401 () Bool)

(assert (=> start!82478 m!891401))

(declare-fun m!891403 () Bool)

(assert (=> mapNonEmpty!33913 m!891403))

(check-sat (not start!82478) tp_is_empty!21289 (not b!960530) (not b!960532) (not mapNonEmpty!33913))
(check-sat)
