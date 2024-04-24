; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40440 () Bool)

(assert start!40440)

(declare-fun b!445150 () Bool)

(declare-fun res!264125 () Bool)

(declare-fun e!261692 () Bool)

(assert (=> b!445150 (=> (not res!264125) (not e!261692))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27492 0))(
  ( (array!27493 (arr!13193 (Array (_ BitVec 32) (_ BitVec 64))) (size!13545 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27492)

(assert (=> b!445150 (= res!264125 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13545 _keys!709))))))

(declare-fun mapIsEmpty!19386 () Bool)

(declare-fun mapRes!19386 () Bool)

(assert (=> mapIsEmpty!19386 mapRes!19386))

(declare-fun b!445152 () Bool)

(declare-fun e!261695 () Bool)

(assert (=> b!445152 (= e!261692 e!261695)))

(declare-fun res!264119 () Bool)

(assert (=> b!445152 (=> (not res!264119) (not e!261695))))

(declare-fun lt!203627 () array!27492)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27492 (_ BitVec 32)) Bool)

(assert (=> b!445152 (= res!264119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203627 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!445152 (= lt!203627 (array!27493 (store (arr!13193 _keys!709) i!563 k0!794) (size!13545 _keys!709)))))

(declare-fun b!445153 () Bool)

(declare-fun res!264126 () Bool)

(assert (=> b!445153 (=> (not res!264126) (not e!261692))))

(declare-datatypes ((List!7802 0))(
  ( (Nil!7799) (Cons!7798 (h!8654 (_ BitVec 64)) (t!13552 List!7802)) )
))
(declare-fun arrayNoDuplicates!0 (array!27492 (_ BitVec 32) List!7802) Bool)

(assert (=> b!445153 (= res!264126 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun b!445154 () Bool)

(declare-fun e!261694 () Bool)

(declare-fun tp_is_empty!11839 () Bool)

(assert (=> b!445154 (= e!261694 tp_is_empty!11839)))

(declare-fun b!445155 () Bool)

(declare-fun res!264121 () Bool)

(assert (=> b!445155 (=> (not res!264121) (not e!261692))))

(declare-fun arrayContainsKey!0 (array!27492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445155 (= res!264121 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445156 () Bool)

(assert (=> b!445156 (= e!261695 false)))

(declare-fun lt!203628 () Bool)

(assert (=> b!445156 (= lt!203628 (arrayNoDuplicates!0 lt!203627 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun b!445157 () Bool)

(declare-fun res!264120 () Bool)

(assert (=> b!445157 (=> (not res!264120) (not e!261692))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16891 0))(
  ( (V!16892 (val!5964 Int)) )
))
(declare-datatypes ((ValueCell!5576 0))(
  ( (ValueCellFull!5576 (v!8216 V!16891)) (EmptyCell!5576) )
))
(declare-datatypes ((array!27494 0))(
  ( (array!27495 (arr!13194 (Array (_ BitVec 32) ValueCell!5576)) (size!13546 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27494)

(assert (=> b!445157 (= res!264120 (and (= (size!13546 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13545 _keys!709) (size!13546 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445158 () Bool)

(declare-fun res!264127 () Bool)

(assert (=> b!445158 (=> (not res!264127) (not e!261692))))

(assert (=> b!445158 (= res!264127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445159 () Bool)

(declare-fun e!261696 () Bool)

(assert (=> b!445159 (= e!261696 tp_is_empty!11839)))

(declare-fun b!445160 () Bool)

(declare-fun res!264118 () Bool)

(assert (=> b!445160 (=> (not res!264118) (not e!261692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445160 (= res!264118 (validKeyInArray!0 k0!794))))

(declare-fun b!445161 () Bool)

(declare-fun e!261691 () Bool)

(assert (=> b!445161 (= e!261691 (and e!261694 mapRes!19386))))

(declare-fun condMapEmpty!19386 () Bool)

(declare-fun mapDefault!19386 () ValueCell!5576)

(assert (=> b!445161 (= condMapEmpty!19386 (= (arr!13194 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5576)) mapDefault!19386)))))

(declare-fun res!264122 () Bool)

(assert (=> start!40440 (=> (not res!264122) (not e!261692))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40440 (= res!264122 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13545 _keys!709))))))

(assert (=> start!40440 e!261692))

(assert (=> start!40440 true))

(declare-fun array_inv!9644 (array!27494) Bool)

(assert (=> start!40440 (and (array_inv!9644 _values!549) e!261691)))

(declare-fun array_inv!9645 (array!27492) Bool)

(assert (=> start!40440 (array_inv!9645 _keys!709)))

(declare-fun b!445151 () Bool)

(declare-fun res!264124 () Bool)

(assert (=> b!445151 (=> (not res!264124) (not e!261692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445151 (= res!264124 (validMask!0 mask!1025))))

(declare-fun b!445162 () Bool)

(declare-fun res!264123 () Bool)

(assert (=> b!445162 (=> (not res!264123) (not e!261692))))

(assert (=> b!445162 (= res!264123 (or (= (select (arr!13193 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13193 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19386 () Bool)

(declare-fun tp!37368 () Bool)

(assert (=> mapNonEmpty!19386 (= mapRes!19386 (and tp!37368 e!261696))))

(declare-fun mapRest!19386 () (Array (_ BitVec 32) ValueCell!5576))

(declare-fun mapKey!19386 () (_ BitVec 32))

(declare-fun mapValue!19386 () ValueCell!5576)

(assert (=> mapNonEmpty!19386 (= (arr!13194 _values!549) (store mapRest!19386 mapKey!19386 mapValue!19386))))

(assert (= (and start!40440 res!264122) b!445151))

(assert (= (and b!445151 res!264124) b!445157))

(assert (= (and b!445157 res!264120) b!445158))

(assert (= (and b!445158 res!264127) b!445153))

(assert (= (and b!445153 res!264126) b!445150))

(assert (= (and b!445150 res!264125) b!445160))

(assert (= (and b!445160 res!264118) b!445162))

(assert (= (and b!445162 res!264123) b!445155))

(assert (= (and b!445155 res!264121) b!445152))

(assert (= (and b!445152 res!264119) b!445156))

(assert (= (and b!445161 condMapEmpty!19386) mapIsEmpty!19386))

(assert (= (and b!445161 (not condMapEmpty!19386)) mapNonEmpty!19386))

(get-info :version)

(assert (= (and mapNonEmpty!19386 ((_ is ValueCellFull!5576) mapValue!19386)) b!445159))

(assert (= (and b!445161 ((_ is ValueCellFull!5576) mapDefault!19386)) b!445154))

(assert (= start!40440 b!445161))

(declare-fun m!431007 () Bool)

(assert (=> b!445153 m!431007))

(declare-fun m!431009 () Bool)

(assert (=> b!445162 m!431009))

(declare-fun m!431011 () Bool)

(assert (=> b!445158 m!431011))

(declare-fun m!431013 () Bool)

(assert (=> mapNonEmpty!19386 m!431013))

(declare-fun m!431015 () Bool)

(assert (=> b!445152 m!431015))

(declare-fun m!431017 () Bool)

(assert (=> b!445152 m!431017))

(declare-fun m!431019 () Bool)

(assert (=> b!445156 m!431019))

(declare-fun m!431021 () Bool)

(assert (=> b!445160 m!431021))

(declare-fun m!431023 () Bool)

(assert (=> b!445155 m!431023))

(declare-fun m!431025 () Bool)

(assert (=> start!40440 m!431025))

(declare-fun m!431027 () Bool)

(assert (=> start!40440 m!431027))

(declare-fun m!431029 () Bool)

(assert (=> b!445151 m!431029))

(check-sat (not b!445153) tp_is_empty!11839 (not start!40440) (not b!445156) (not b!445155) (not b!445158) (not b!445152) (not b!445160) (not b!445151) (not mapNonEmpty!19386))
(check-sat)
