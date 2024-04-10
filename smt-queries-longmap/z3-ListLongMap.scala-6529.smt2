; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83060 () Bool)

(assert start!83060)

(declare-fun b!968984 () Bool)

(declare-fun e!546198 () Bool)

(declare-fun e!546199 () Bool)

(declare-fun mapRes!34936 () Bool)

(assert (=> b!968984 (= e!546198 (and e!546199 mapRes!34936))))

(declare-fun condMapEmpty!34936 () Bool)

(declare-datatypes ((V!34251 0))(
  ( (V!34252 (val!11026 Int)) )
))
(declare-datatypes ((ValueCell!10494 0))(
  ( (ValueCellFull!10494 (v!13585 V!34251)) (EmptyCell!10494) )
))
(declare-datatypes ((array!59975 0))(
  ( (array!59976 (arr!28851 (Array (_ BitVec 32) ValueCell!10494)) (size!29330 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59975)

(declare-fun mapDefault!34936 () ValueCell!10494)

(assert (=> b!968984 (= condMapEmpty!34936 (= (arr!28851 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10494)) mapDefault!34936)))))

(declare-fun b!968985 () Bool)

(declare-fun res!648614 () Bool)

(declare-fun e!546196 () Bool)

(assert (=> b!968985 (=> (not res!648614) (not e!546196))))

(declare-datatypes ((array!59977 0))(
  ( (array!59978 (arr!28852 (Array (_ BitVec 32) (_ BitVec 64))) (size!29331 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59977)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59977 (_ BitVec 32)) Bool)

(assert (=> b!968985 (= res!648614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648615 () Bool)

(assert (=> start!83060 (=> (not res!648615) (not e!546196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83060 (= res!648615 (validMask!0 mask!2147))))

(assert (=> start!83060 e!546196))

(assert (=> start!83060 true))

(declare-fun array_inv!22333 (array!59975) Bool)

(assert (=> start!83060 (and (array_inv!22333 _values!1425) e!546198)))

(declare-fun array_inv!22334 (array!59977) Bool)

(assert (=> start!83060 (array_inv!22334 _keys!1717)))

(declare-fun mapIsEmpty!34936 () Bool)

(assert (=> mapIsEmpty!34936 mapRes!34936))

(declare-fun b!968986 () Bool)

(declare-fun tp_is_empty!21951 () Bool)

(assert (=> b!968986 (= e!546199 tp_is_empty!21951)))

(declare-fun b!968987 () Bool)

(declare-fun e!546195 () Bool)

(assert (=> b!968987 (= e!546195 tp_is_empty!21951)))

(declare-fun b!968988 () Bool)

(declare-fun res!648613 () Bool)

(assert (=> b!968988 (=> (not res!648613) (not e!546196))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968988 (= res!648613 (and (= (size!29330 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29331 _keys!1717) (size!29330 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34936 () Bool)

(declare-fun tp!66504 () Bool)

(assert (=> mapNonEmpty!34936 (= mapRes!34936 (and tp!66504 e!546195))))

(declare-fun mapValue!34936 () ValueCell!10494)

(declare-fun mapRest!34936 () (Array (_ BitVec 32) ValueCell!10494))

(declare-fun mapKey!34936 () (_ BitVec 32))

(assert (=> mapNonEmpty!34936 (= (arr!28851 _values!1425) (store mapRest!34936 mapKey!34936 mapValue!34936))))

(declare-fun b!968989 () Bool)

(assert (=> b!968989 (= e!546196 false)))

(declare-fun lt!431576 () Bool)

(declare-datatypes ((List!20010 0))(
  ( (Nil!20007) (Cons!20006 (h!21168 (_ BitVec 64)) (t!28373 List!20010)) )
))
(declare-fun arrayNoDuplicates!0 (array!59977 (_ BitVec 32) List!20010) Bool)

(assert (=> b!968989 (= lt!431576 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20007))))

(assert (= (and start!83060 res!648615) b!968988))

(assert (= (and b!968988 res!648613) b!968985))

(assert (= (and b!968985 res!648614) b!968989))

(assert (= (and b!968984 condMapEmpty!34936) mapIsEmpty!34936))

(assert (= (and b!968984 (not condMapEmpty!34936)) mapNonEmpty!34936))

(get-info :version)

(assert (= (and mapNonEmpty!34936 ((_ is ValueCellFull!10494) mapValue!34936)) b!968987))

(assert (= (and b!968984 ((_ is ValueCellFull!10494) mapDefault!34936)) b!968986))

(assert (= start!83060 b!968984))

(declare-fun m!897139 () Bool)

(assert (=> b!968985 m!897139))

(declare-fun m!897141 () Bool)

(assert (=> start!83060 m!897141))

(declare-fun m!897143 () Bool)

(assert (=> start!83060 m!897143))

(declare-fun m!897145 () Bool)

(assert (=> start!83060 m!897145))

(declare-fun m!897147 () Bool)

(assert (=> mapNonEmpty!34936 m!897147))

(declare-fun m!897149 () Bool)

(assert (=> b!968989 m!897149))

(check-sat (not mapNonEmpty!34936) (not b!968989) tp_is_empty!21951 (not start!83060) (not b!968985))
(check-sat)
