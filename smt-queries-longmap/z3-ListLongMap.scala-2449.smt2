; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38514 () Bool)

(assert start!38514)

(declare-fun mapIsEmpty!16521 () Bool)

(declare-fun mapRes!16521 () Bool)

(assert (=> mapIsEmpty!16521 mapRes!16521))

(declare-fun mapNonEmpty!16521 () Bool)

(declare-fun tp!32316 () Bool)

(declare-fun e!240577 () Bool)

(assert (=> mapNonEmpty!16521 (= mapRes!16521 (and tp!32316 e!240577))))

(declare-datatypes ((V!14349 0))(
  ( (V!14350 (val!5011 Int)) )
))
(declare-datatypes ((ValueCell!4623 0))(
  ( (ValueCellFull!4623 (v!7258 V!14349)) (EmptyCell!4623) )
))
(declare-fun mapRest!16521 () (Array (_ BitVec 32) ValueCell!4623))

(declare-fun mapKey!16521 () (_ BitVec 32))

(declare-datatypes ((array!23777 0))(
  ( (array!23778 (arr!11338 (Array (_ BitVec 32) ValueCell!4623)) (size!11690 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23777)

(declare-fun mapValue!16521 () ValueCell!4623)

(assert (=> mapNonEmpty!16521 (= (arr!11338 _values!549) (store mapRest!16521 mapKey!16521 mapValue!16521))))

(declare-fun b!397919 () Bool)

(declare-fun e!240580 () Bool)

(declare-fun e!240578 () Bool)

(assert (=> b!397919 (= e!240580 (and e!240578 mapRes!16521))))

(declare-fun condMapEmpty!16521 () Bool)

(declare-fun mapDefault!16521 () ValueCell!4623)

(assert (=> b!397919 (= condMapEmpty!16521 (= (arr!11338 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4623)) mapDefault!16521)))))

(declare-fun b!397920 () Bool)

(declare-fun res!228576 () Bool)

(declare-fun e!240581 () Bool)

(assert (=> b!397920 (=> (not res!228576) (not e!240581))))

(declare-datatypes ((array!23779 0))(
  ( (array!23780 (arr!11339 (Array (_ BitVec 32) (_ BitVec 64))) (size!11691 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23779)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397920 (= res!228576 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397921 () Bool)

(declare-fun res!228572 () Bool)

(assert (=> b!397921 (=> (not res!228572) (not e!240581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397921 (= res!228572 (validKeyInArray!0 k0!794))))

(declare-fun b!397922 () Bool)

(declare-fun res!228578 () Bool)

(assert (=> b!397922 (=> (not res!228578) (not e!240581))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397922 (= res!228578 (or (= (select (arr!11339 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11339 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397923 () Bool)

(declare-fun res!228577 () Bool)

(assert (=> b!397923 (=> (not res!228577) (not e!240581))))

(assert (=> b!397923 (= res!228577 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11691 _keys!709))))))

(declare-fun b!397924 () Bool)

(declare-fun res!228575 () Bool)

(assert (=> b!397924 (=> (not res!228575) (not e!240581))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23779 (_ BitVec 32)) Bool)

(assert (=> b!397924 (= res!228575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397925 () Bool)

(declare-fun e!240579 () Bool)

(assert (=> b!397925 (= e!240581 e!240579)))

(declare-fun res!228573 () Bool)

(assert (=> b!397925 (=> (not res!228573) (not e!240579))))

(declare-fun lt!187378 () array!23779)

(assert (=> b!397925 (= res!228573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187378 mask!1025))))

(assert (=> b!397925 (= lt!187378 (array!23780 (store (arr!11339 _keys!709) i!563 k0!794) (size!11691 _keys!709)))))

(declare-fun b!397926 () Bool)

(assert (=> b!397926 (= e!240579 false)))

(declare-fun lt!187379 () Bool)

(declare-datatypes ((List!6560 0))(
  ( (Nil!6557) (Cons!6556 (h!7412 (_ BitVec 64)) (t!11734 List!6560)) )
))
(declare-fun arrayNoDuplicates!0 (array!23779 (_ BitVec 32) List!6560) Bool)

(assert (=> b!397926 (= lt!187379 (arrayNoDuplicates!0 lt!187378 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun res!228579 () Bool)

(assert (=> start!38514 (=> (not res!228579) (not e!240581))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38514 (= res!228579 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11691 _keys!709))))))

(assert (=> start!38514 e!240581))

(assert (=> start!38514 true))

(declare-fun array_inv!8310 (array!23777) Bool)

(assert (=> start!38514 (and (array_inv!8310 _values!549) e!240580)))

(declare-fun array_inv!8311 (array!23779) Bool)

(assert (=> start!38514 (array_inv!8311 _keys!709)))

(declare-fun b!397927 () Bool)

(declare-fun tp_is_empty!9933 () Bool)

(assert (=> b!397927 (= e!240578 tp_is_empty!9933)))

(declare-fun b!397928 () Bool)

(assert (=> b!397928 (= e!240577 tp_is_empty!9933)))

(declare-fun b!397929 () Bool)

(declare-fun res!228574 () Bool)

(assert (=> b!397929 (=> (not res!228574) (not e!240581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397929 (= res!228574 (validMask!0 mask!1025))))

(declare-fun b!397930 () Bool)

(declare-fun res!228571 () Bool)

(assert (=> b!397930 (=> (not res!228571) (not e!240581))))

(assert (=> b!397930 (= res!228571 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun b!397931 () Bool)

(declare-fun res!228570 () Bool)

(assert (=> b!397931 (=> (not res!228570) (not e!240581))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397931 (= res!228570 (and (= (size!11690 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11691 _keys!709) (size!11690 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38514 res!228579) b!397929))

(assert (= (and b!397929 res!228574) b!397931))

(assert (= (and b!397931 res!228570) b!397924))

(assert (= (and b!397924 res!228575) b!397930))

(assert (= (and b!397930 res!228571) b!397923))

(assert (= (and b!397923 res!228577) b!397921))

(assert (= (and b!397921 res!228572) b!397922))

(assert (= (and b!397922 res!228578) b!397920))

(assert (= (and b!397920 res!228576) b!397925))

(assert (= (and b!397925 res!228573) b!397926))

(assert (= (and b!397919 condMapEmpty!16521) mapIsEmpty!16521))

(assert (= (and b!397919 (not condMapEmpty!16521)) mapNonEmpty!16521))

(get-info :version)

(assert (= (and mapNonEmpty!16521 ((_ is ValueCellFull!4623) mapValue!16521)) b!397928))

(assert (= (and b!397919 ((_ is ValueCellFull!4623) mapDefault!16521)) b!397927))

(assert (= start!38514 b!397919))

(declare-fun m!392983 () Bool)

(assert (=> b!397930 m!392983))

(declare-fun m!392985 () Bool)

(assert (=> mapNonEmpty!16521 m!392985))

(declare-fun m!392987 () Bool)

(assert (=> b!397925 m!392987))

(declare-fun m!392989 () Bool)

(assert (=> b!397925 m!392989))

(declare-fun m!392991 () Bool)

(assert (=> b!397921 m!392991))

(declare-fun m!392993 () Bool)

(assert (=> b!397922 m!392993))

(declare-fun m!392995 () Bool)

(assert (=> b!397926 m!392995))

(declare-fun m!392997 () Bool)

(assert (=> b!397920 m!392997))

(declare-fun m!392999 () Bool)

(assert (=> b!397924 m!392999))

(declare-fun m!393001 () Bool)

(assert (=> start!38514 m!393001))

(declare-fun m!393003 () Bool)

(assert (=> start!38514 m!393003))

(declare-fun m!393005 () Bool)

(assert (=> b!397929 m!393005))

(check-sat tp_is_empty!9933 (not b!397924) (not b!397926) (not start!38514) (not b!397930) (not b!397920) (not b!397929) (not b!397925) (not b!397921) (not mapNonEmpty!16521))
(check-sat)
