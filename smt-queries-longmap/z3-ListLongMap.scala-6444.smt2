; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82672 () Bool)

(assert start!82672)

(declare-fun b!962417 () Bool)

(declare-fun e!542744 () Bool)

(declare-fun e!542743 () Bool)

(declare-fun mapRes!34153 () Bool)

(assert (=> b!962417 (= e!542744 (and e!542743 mapRes!34153))))

(declare-fun condMapEmpty!34153 () Bool)

(declare-datatypes ((V!33569 0))(
  ( (V!33570 (val!10770 Int)) )
))
(declare-datatypes ((ValueCell!10238 0))(
  ( (ValueCellFull!10238 (v!13325 V!33569)) (EmptyCell!10238) )
))
(declare-datatypes ((array!59002 0))(
  ( (array!59003 (arr!28365 (Array (_ BitVec 32) ValueCell!10238)) (size!28845 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59002)

(declare-fun mapDefault!34153 () ValueCell!10238)

(assert (=> b!962417 (= condMapEmpty!34153 (= (arr!28365 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10238)) mapDefault!34153)))))

(declare-fun b!962418 () Bool)

(declare-fun tp_is_empty!21439 () Bool)

(assert (=> b!962418 (= e!542743 tp_is_empty!21439)))

(declare-fun b!962419 () Bool)

(declare-fun e!542745 () Bool)

(assert (=> b!962419 (= e!542745 tp_is_empty!21439)))

(declare-fun res!643857 () Bool)

(declare-fun e!542746 () Bool)

(assert (=> start!82672 (=> (not res!643857) (not e!542746))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82672 (= res!643857 (validMask!0 mask!2110))))

(assert (=> start!82672 e!542746))

(assert (=> start!82672 true))

(declare-fun array_inv!22057 (array!59002) Bool)

(assert (=> start!82672 (and (array_inv!22057 _values!1400) e!542744)))

(declare-datatypes ((array!59004 0))(
  ( (array!59005 (arr!28366 (Array (_ BitVec 32) (_ BitVec 64))) (size!28846 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59004)

(declare-fun array_inv!22058 (array!59004) Bool)

(assert (=> start!82672 (array_inv!22058 _keys!1686)))

(declare-fun mapNonEmpty!34153 () Bool)

(declare-fun tp!65083 () Bool)

(assert (=> mapNonEmpty!34153 (= mapRes!34153 (and tp!65083 e!542745))))

(declare-fun mapRest!34153 () (Array (_ BitVec 32) ValueCell!10238))

(declare-fun mapValue!34153 () ValueCell!10238)

(declare-fun mapKey!34153 () (_ BitVec 32))

(assert (=> mapNonEmpty!34153 (= (arr!28365 _values!1400) (store mapRest!34153 mapKey!34153 mapValue!34153))))

(declare-fun b!962420 () Bool)

(declare-fun res!643855 () Bool)

(assert (=> b!962420 (=> (not res!643855) (not e!542746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59004 (_ BitVec 32)) Bool)

(assert (=> b!962420 (= res!643855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962421 () Bool)

(declare-fun res!643856 () Bool)

(assert (=> b!962421 (=> (not res!643856) (not e!542746))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962421 (= res!643856 (and (= (size!28845 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28846 _keys!1686) (size!28845 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962422 () Bool)

(assert (=> b!962422 (= e!542746 false)))

(declare-fun lt!431129 () Bool)

(declare-datatypes ((List!19672 0))(
  ( (Nil!19669) (Cons!19668 (h!20836 (_ BitVec 64)) (t!28027 List!19672)) )
))
(declare-fun arrayNoDuplicates!0 (array!59004 (_ BitVec 32) List!19672) Bool)

(assert (=> b!962422 (= lt!431129 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19669))))

(declare-fun mapIsEmpty!34153 () Bool)

(assert (=> mapIsEmpty!34153 mapRes!34153))

(assert (= (and start!82672 res!643857) b!962421))

(assert (= (and b!962421 res!643856) b!962420))

(assert (= (and b!962420 res!643855) b!962422))

(assert (= (and b!962417 condMapEmpty!34153) mapIsEmpty!34153))

(assert (= (and b!962417 (not condMapEmpty!34153)) mapNonEmpty!34153))

(get-info :version)

(assert (= (and mapNonEmpty!34153 ((_ is ValueCellFull!10238) mapValue!34153)) b!962419))

(assert (= (and b!962417 ((_ is ValueCellFull!10238) mapDefault!34153)) b!962418))

(assert (= start!82672 b!962417))

(declare-fun m!892735 () Bool)

(assert (=> start!82672 m!892735))

(declare-fun m!892737 () Bool)

(assert (=> start!82672 m!892737))

(declare-fun m!892739 () Bool)

(assert (=> start!82672 m!892739))

(declare-fun m!892741 () Bool)

(assert (=> mapNonEmpty!34153 m!892741))

(declare-fun m!892743 () Bool)

(assert (=> b!962420 m!892743))

(declare-fun m!892745 () Bool)

(assert (=> b!962422 m!892745))

(check-sat (not b!962422) (not b!962420) (not mapNonEmpty!34153) (not start!82672) tp_is_empty!21439)
(check-sat)
