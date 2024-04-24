; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82346 () Bool)

(assert start!82346)

(declare-fun b!958670 () Bool)

(declare-fun res!641445 () Bool)

(declare-fun e!540534 () Bool)

(assert (=> b!958670 (=> (not res!641445) (not e!540534))))

(declare-datatypes ((array!58444 0))(
  ( (array!58445 (arr!28091 (Array (_ BitVec 32) (_ BitVec 64))) (size!28571 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58444)

(declare-datatypes ((List!19518 0))(
  ( (Nil!19515) (Cons!19514 (h!20682 (_ BitVec 64)) (t!27873 List!19518)) )
))
(declare-fun arrayNoDuplicates!0 (array!58444 (_ BitVec 32) List!19518) Bool)

(assert (=> b!958670 (= res!641445 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19515))))

(declare-fun b!958671 () Bool)

(declare-fun res!641444 () Bool)

(assert (=> b!958671 (=> (not res!641444) (not e!540534))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33193 0))(
  ( (V!33194 (val!10629 Int)) )
))
(declare-datatypes ((ValueCell!10097 0))(
  ( (ValueCellFull!10097 (v!13183 V!33193)) (EmptyCell!10097) )
))
(declare-datatypes ((array!58446 0))(
  ( (array!58447 (arr!28092 (Array (_ BitVec 32) ValueCell!10097)) (size!28572 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58446)

(assert (=> b!958671 (= res!641444 (and (= (size!28572 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28571 _keys!1668) (size!28572 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958672 () Bool)

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958672 (= e!540534 (bvsgt from!2064 (size!28571 _keys!1668)))))

(declare-fun b!958673 () Bool)

(declare-fun e!540537 () Bool)

(declare-fun tp_is_empty!21157 () Bool)

(assert (=> b!958673 (= e!540537 tp_is_empty!21157)))

(declare-fun b!958674 () Bool)

(declare-fun res!641446 () Bool)

(assert (=> b!958674 (=> (not res!641446) (not e!540534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58444 (_ BitVec 32)) Bool)

(assert (=> b!958674 (= res!641446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958675 () Bool)

(declare-fun e!540535 () Bool)

(declare-fun e!540533 () Bool)

(declare-fun mapRes!33715 () Bool)

(assert (=> b!958675 (= e!540535 (and e!540533 mapRes!33715))))

(declare-fun condMapEmpty!33715 () Bool)

(declare-fun mapDefault!33715 () ValueCell!10097)

(assert (=> b!958675 (= condMapEmpty!33715 (= (arr!28092 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10097)) mapDefault!33715)))))

(declare-fun mapIsEmpty!33715 () Bool)

(assert (=> mapIsEmpty!33715 mapRes!33715))

(declare-fun mapNonEmpty!33715 () Bool)

(declare-fun tp!64321 () Bool)

(assert (=> mapNonEmpty!33715 (= mapRes!33715 (and tp!64321 e!540537))))

(declare-fun mapValue!33715 () ValueCell!10097)

(declare-fun mapRest!33715 () (Array (_ BitVec 32) ValueCell!10097))

(declare-fun mapKey!33715 () (_ BitVec 32))

(assert (=> mapNonEmpty!33715 (= (arr!28092 _values!1386) (store mapRest!33715 mapKey!33715 mapValue!33715))))

(declare-fun res!641441 () Bool)

(assert (=> start!82346 (=> (not res!641441) (not e!540534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82346 (= res!641441 (validMask!0 mask!2088))))

(assert (=> start!82346 e!540534))

(assert (=> start!82346 true))

(declare-fun array_inv!21863 (array!58444) Bool)

(assert (=> start!82346 (array_inv!21863 _keys!1668)))

(declare-fun array_inv!21864 (array!58446) Bool)

(assert (=> start!82346 (and (array_inv!21864 _values!1386) e!540535)))

(declare-fun b!958676 () Bool)

(declare-fun res!641443 () Bool)

(assert (=> b!958676 (=> (not res!641443) (not e!540534))))

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!958676 (= res!641443 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28571 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28571 _keys!1668))))))

(declare-fun b!958677 () Bool)

(declare-fun res!641442 () Bool)

(assert (=> b!958677 (=> (not res!641442) (not e!540534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958677 (= res!641442 (validKeyInArray!0 (select (arr!28091 _keys!1668) i!793)))))

(declare-fun b!958678 () Bool)

(assert (=> b!958678 (= e!540533 tp_is_empty!21157)))

(assert (= (and start!82346 res!641441) b!958671))

(assert (= (and b!958671 res!641444) b!958674))

(assert (= (and b!958674 res!641446) b!958670))

(assert (= (and b!958670 res!641445) b!958676))

(assert (= (and b!958676 res!641443) b!958677))

(assert (= (and b!958677 res!641442) b!958672))

(assert (= (and b!958675 condMapEmpty!33715) mapIsEmpty!33715))

(assert (= (and b!958675 (not condMapEmpty!33715)) mapNonEmpty!33715))

(get-info :version)

(assert (= (and mapNonEmpty!33715 ((_ is ValueCellFull!10097) mapValue!33715)) b!958673))

(assert (= (and b!958675 ((_ is ValueCellFull!10097) mapDefault!33715)) b!958678))

(assert (= start!82346 b!958675))

(declare-fun m!889923 () Bool)

(assert (=> mapNonEmpty!33715 m!889923))

(declare-fun m!889925 () Bool)

(assert (=> start!82346 m!889925))

(declare-fun m!889927 () Bool)

(assert (=> start!82346 m!889927))

(declare-fun m!889929 () Bool)

(assert (=> start!82346 m!889929))

(declare-fun m!889931 () Bool)

(assert (=> b!958674 m!889931))

(declare-fun m!889933 () Bool)

(assert (=> b!958670 m!889933))

(declare-fun m!889935 () Bool)

(assert (=> b!958677 m!889935))

(assert (=> b!958677 m!889935))

(declare-fun m!889937 () Bool)

(assert (=> b!958677 m!889937))

(check-sat (not b!958677) tp_is_empty!21157 (not mapNonEmpty!33715) (not b!958674) (not b!958670) (not start!82346))
(check-sat)
