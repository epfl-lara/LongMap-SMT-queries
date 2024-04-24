; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82708 () Bool)

(assert start!82708)

(declare-fun b_free!18673 () Bool)

(declare-fun b_next!18673 () Bool)

(assert (=> start!82708 (= b_free!18673 (not b_next!18673))))

(declare-fun tp!65139 () Bool)

(declare-fun b_and!30171 () Bool)

(assert (=> start!82708 (= tp!65139 b_and!30171)))

(declare-fun b!962774 () Bool)

(declare-fun e!543016 () Bool)

(declare-fun tp_is_empty!21475 () Bool)

(assert (=> b!962774 (= e!543016 tp_is_empty!21475)))

(declare-fun b!962775 () Bool)

(declare-fun res!644053 () Bool)

(declare-fun e!543014 () Bool)

(assert (=> b!962775 (=> (not res!644053) (not e!543014))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33617 0))(
  ( (V!33618 (val!10788 Int)) )
))
(declare-datatypes ((ValueCell!10256 0))(
  ( (ValueCellFull!10256 (v!13343 V!33617)) (EmptyCell!10256) )
))
(declare-datatypes ((array!59068 0))(
  ( (array!59069 (arr!28398 (Array (_ BitVec 32) ValueCell!10256)) (size!28878 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59068)

(declare-datatypes ((array!59070 0))(
  ( (array!59071 (arr!28399 (Array (_ BitVec 32) (_ BitVec 64))) (size!28879 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59070)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962775 (= res!644053 (and (= (size!28878 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28879 _keys!1686) (size!28878 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962776 () Bool)

(declare-fun res!644050 () Bool)

(assert (=> b!962776 (=> (not res!644050) (not e!543014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59070 (_ BitVec 32)) Bool)

(assert (=> b!962776 (= res!644050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962777 () Bool)

(assert (=> b!962777 (= e!543014 false)))

(declare-fun minValue!1342 () V!33617)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431174 () Bool)

(declare-fun zeroValue!1342 () V!33617)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13832 0))(
  ( (tuple2!13833 (_1!6927 (_ BitVec 64)) (_2!6927 V!33617)) )
))
(declare-datatypes ((List!19684 0))(
  ( (Nil!19681) (Cons!19680 (h!20848 tuple2!13832) (t!28039 List!19684)) )
))
(declare-datatypes ((ListLongMap!12531 0))(
  ( (ListLongMap!12532 (toList!6281 List!19684)) )
))
(declare-fun contains!5396 (ListLongMap!12531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3514 (array!59070 array!59068 (_ BitVec 32) (_ BitVec 32) V!33617 V!33617 (_ BitVec 32) Int) ListLongMap!12531)

(assert (=> b!962777 (= lt!431174 (contains!5396 (getCurrentListMap!3514 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28399 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34207 () Bool)

(declare-fun mapRes!34207 () Bool)

(declare-fun tp!65140 () Bool)

(assert (=> mapNonEmpty!34207 (= mapRes!34207 (and tp!65140 e!543016))))

(declare-fun mapValue!34207 () ValueCell!10256)

(declare-fun mapKey!34207 () (_ BitVec 32))

(declare-fun mapRest!34207 () (Array (_ BitVec 32) ValueCell!10256))

(assert (=> mapNonEmpty!34207 (= (arr!28398 _values!1400) (store mapRest!34207 mapKey!34207 mapValue!34207))))

(declare-fun b!962778 () Bool)

(declare-fun e!543013 () Bool)

(assert (=> b!962778 (= e!543013 tp_is_empty!21475)))

(declare-fun mapIsEmpty!34207 () Bool)

(assert (=> mapIsEmpty!34207 mapRes!34207))

(declare-fun b!962779 () Bool)

(declare-fun res!644051 () Bool)

(assert (=> b!962779 (=> (not res!644051) (not e!543014))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962779 (= res!644051 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28879 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28879 _keys!1686))))))

(declare-fun res!644052 () Bool)

(assert (=> start!82708 (=> (not res!644052) (not e!543014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82708 (= res!644052 (validMask!0 mask!2110))))

(assert (=> start!82708 e!543014))

(assert (=> start!82708 true))

(declare-fun e!543015 () Bool)

(declare-fun array_inv!22079 (array!59068) Bool)

(assert (=> start!82708 (and (array_inv!22079 _values!1400) e!543015)))

(declare-fun array_inv!22080 (array!59070) Bool)

(assert (=> start!82708 (array_inv!22080 _keys!1686)))

(assert (=> start!82708 tp!65139))

(assert (=> start!82708 tp_is_empty!21475))

(declare-fun b!962780 () Bool)

(assert (=> b!962780 (= e!543015 (and e!543013 mapRes!34207))))

(declare-fun condMapEmpty!34207 () Bool)

(declare-fun mapDefault!34207 () ValueCell!10256)

(assert (=> b!962780 (= condMapEmpty!34207 (= (arr!28398 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10256)) mapDefault!34207)))))

(declare-fun b!962781 () Bool)

(declare-fun res!644054 () Bool)

(assert (=> b!962781 (=> (not res!644054) (not e!543014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962781 (= res!644054 (validKeyInArray!0 (select (arr!28399 _keys!1686) i!803)))))

(declare-fun b!962782 () Bool)

(declare-fun res!644055 () Bool)

(assert (=> b!962782 (=> (not res!644055) (not e!543014))))

(declare-datatypes ((List!19685 0))(
  ( (Nil!19682) (Cons!19681 (h!20849 (_ BitVec 64)) (t!28040 List!19685)) )
))
(declare-fun arrayNoDuplicates!0 (array!59070 (_ BitVec 32) List!19685) Bool)

(assert (=> b!962782 (= res!644055 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19682))))

(assert (= (and start!82708 res!644052) b!962775))

(assert (= (and b!962775 res!644053) b!962776))

(assert (= (and b!962776 res!644050) b!962782))

(assert (= (and b!962782 res!644055) b!962779))

(assert (= (and b!962779 res!644051) b!962781))

(assert (= (and b!962781 res!644054) b!962777))

(assert (= (and b!962780 condMapEmpty!34207) mapIsEmpty!34207))

(assert (= (and b!962780 (not condMapEmpty!34207)) mapNonEmpty!34207))

(get-info :version)

(assert (= (and mapNonEmpty!34207 ((_ is ValueCellFull!10256) mapValue!34207)) b!962774))

(assert (= (and b!962780 ((_ is ValueCellFull!10256) mapDefault!34207)) b!962778))

(assert (= start!82708 b!962780))

(declare-fun m!892963 () Bool)

(assert (=> b!962781 m!892963))

(assert (=> b!962781 m!892963))

(declare-fun m!892965 () Bool)

(assert (=> b!962781 m!892965))

(declare-fun m!892967 () Bool)

(assert (=> start!82708 m!892967))

(declare-fun m!892969 () Bool)

(assert (=> start!82708 m!892969))

(declare-fun m!892971 () Bool)

(assert (=> start!82708 m!892971))

(declare-fun m!892973 () Bool)

(assert (=> b!962776 m!892973))

(declare-fun m!892975 () Bool)

(assert (=> b!962777 m!892975))

(assert (=> b!962777 m!892963))

(assert (=> b!962777 m!892975))

(assert (=> b!962777 m!892963))

(declare-fun m!892977 () Bool)

(assert (=> b!962777 m!892977))

(declare-fun m!892979 () Bool)

(assert (=> b!962782 m!892979))

(declare-fun m!892981 () Bool)

(assert (=> mapNonEmpty!34207 m!892981))

(check-sat (not b!962781) (not b!962782) (not b!962776) (not mapNonEmpty!34207) tp_is_empty!21475 b_and!30171 (not b_next!18673) (not start!82708) (not b!962777))
(check-sat b_and!30171 (not b_next!18673))
