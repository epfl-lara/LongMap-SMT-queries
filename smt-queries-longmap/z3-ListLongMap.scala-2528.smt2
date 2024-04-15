; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38972 () Bool)

(assert start!38972)

(declare-fun b!408148 () Bool)

(declare-fun res!236175 () Bool)

(declare-fun e!244976 () Bool)

(assert (=> b!408148 (=> (not res!236175) (not e!244976))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24677 0))(
  ( (array!24678 (arr!11788 (Array (_ BitVec 32) (_ BitVec 64))) (size!12141 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24677)

(assert (=> b!408148 (= res!236175 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12141 _keys!709))))))

(declare-fun b!408149 () Bool)

(declare-fun e!244978 () Bool)

(declare-fun e!244975 () Bool)

(declare-fun mapRes!17229 () Bool)

(assert (=> b!408149 (= e!244978 (and e!244975 mapRes!17229))))

(declare-fun condMapEmpty!17229 () Bool)

(declare-datatypes ((V!14979 0))(
  ( (V!14980 (val!5247 Int)) )
))
(declare-datatypes ((ValueCell!4859 0))(
  ( (ValueCellFull!4859 (v!7488 V!14979)) (EmptyCell!4859) )
))
(declare-datatypes ((array!24679 0))(
  ( (array!24680 (arr!11789 (Array (_ BitVec 32) ValueCell!4859)) (size!12142 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24679)

(declare-fun mapDefault!17229 () ValueCell!4859)

(assert (=> b!408149 (= condMapEmpty!17229 (= (arr!11789 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4859)) mapDefault!17229)))))

(declare-fun b!408150 () Bool)

(declare-fun res!236177 () Bool)

(assert (=> b!408150 (=> (not res!236177) (not e!244976))))

(declare-datatypes ((List!6808 0))(
  ( (Nil!6805) (Cons!6804 (h!7660 (_ BitVec 64)) (t!11973 List!6808)) )
))
(declare-fun arrayNoDuplicates!0 (array!24677 (_ BitVec 32) List!6808) Bool)

(assert (=> b!408150 (= res!236177 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6805))))

(declare-fun b!408151 () Bool)

(declare-fun res!236173 () Bool)

(assert (=> b!408151 (=> (not res!236173) (not e!244976))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408151 (= res!236173 (validKeyInArray!0 k0!794))))

(declare-fun res!236171 () Bool)

(assert (=> start!38972 (=> (not res!236171) (not e!244976))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38972 (= res!236171 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12141 _keys!709))))))

(assert (=> start!38972 e!244976))

(assert (=> start!38972 true))

(declare-fun array_inv!8646 (array!24679) Bool)

(assert (=> start!38972 (and (array_inv!8646 _values!549) e!244978)))

(declare-fun array_inv!8647 (array!24677) Bool)

(assert (=> start!38972 (array_inv!8647 _keys!709)))

(declare-fun b!408152 () Bool)

(declare-fun e!244980 () Bool)

(declare-fun tp_is_empty!10405 () Bool)

(assert (=> b!408152 (= e!244980 tp_is_empty!10405)))

(declare-fun b!408153 () Bool)

(declare-fun res!236178 () Bool)

(assert (=> b!408153 (=> (not res!236178) (not e!244976))))

(assert (=> b!408153 (= res!236178 (or (= (select (arr!11788 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11788 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17229 () Bool)

(declare-fun tp!33348 () Bool)

(assert (=> mapNonEmpty!17229 (= mapRes!17229 (and tp!33348 e!244980))))

(declare-fun mapKey!17229 () (_ BitVec 32))

(declare-fun mapRest!17229 () (Array (_ BitVec 32) ValueCell!4859))

(declare-fun mapValue!17229 () ValueCell!4859)

(assert (=> mapNonEmpty!17229 (= (arr!11789 _values!549) (store mapRest!17229 mapKey!17229 mapValue!17229))))

(declare-fun b!408154 () Bool)

(declare-fun res!236176 () Bool)

(assert (=> b!408154 (=> (not res!236176) (not e!244976))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24677 (_ BitVec 32)) Bool)

(assert (=> b!408154 (= res!236176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408155 () Bool)

(declare-fun res!236172 () Bool)

(assert (=> b!408155 (=> (not res!236172) (not e!244976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408155 (= res!236172 (validMask!0 mask!1025))))

(declare-fun b!408156 () Bool)

(declare-fun res!236174 () Bool)

(assert (=> b!408156 (=> (not res!236174) (not e!244976))))

(declare-fun arrayContainsKey!0 (array!24677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408156 (= res!236174 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408157 () Bool)

(assert (=> b!408157 (= e!244975 tp_is_empty!10405)))

(declare-fun b!408158 () Bool)

(declare-fun e!244979 () Bool)

(assert (=> b!408158 (= e!244979 false)))

(declare-fun lt!188560 () Bool)

(declare-fun lt!188561 () array!24677)

(assert (=> b!408158 (= lt!188560 (arrayNoDuplicates!0 lt!188561 #b00000000000000000000000000000000 Nil!6805))))

(declare-fun mapIsEmpty!17229 () Bool)

(assert (=> mapIsEmpty!17229 mapRes!17229))

(declare-fun b!408159 () Bool)

(assert (=> b!408159 (= e!244976 e!244979)))

(declare-fun res!236169 () Bool)

(assert (=> b!408159 (=> (not res!236169) (not e!244979))))

(assert (=> b!408159 (= res!236169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188561 mask!1025))))

(assert (=> b!408159 (= lt!188561 (array!24678 (store (arr!11788 _keys!709) i!563 k0!794) (size!12141 _keys!709)))))

(declare-fun b!408160 () Bool)

(declare-fun res!236170 () Bool)

(assert (=> b!408160 (=> (not res!236170) (not e!244976))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408160 (= res!236170 (and (= (size!12142 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12141 _keys!709) (size!12142 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38972 res!236171) b!408155))

(assert (= (and b!408155 res!236172) b!408160))

(assert (= (and b!408160 res!236170) b!408154))

(assert (= (and b!408154 res!236176) b!408150))

(assert (= (and b!408150 res!236177) b!408148))

(assert (= (and b!408148 res!236175) b!408151))

(assert (= (and b!408151 res!236173) b!408153))

(assert (= (and b!408153 res!236178) b!408156))

(assert (= (and b!408156 res!236174) b!408159))

(assert (= (and b!408159 res!236169) b!408158))

(assert (= (and b!408149 condMapEmpty!17229) mapIsEmpty!17229))

(assert (= (and b!408149 (not condMapEmpty!17229)) mapNonEmpty!17229))

(get-info :version)

(assert (= (and mapNonEmpty!17229 ((_ is ValueCellFull!4859) mapValue!17229)) b!408152))

(assert (= (and b!408149 ((_ is ValueCellFull!4859) mapDefault!17229)) b!408157))

(assert (= start!38972 b!408149))

(declare-fun m!399003 () Bool)

(assert (=> b!408159 m!399003))

(declare-fun m!399005 () Bool)

(assert (=> b!408159 m!399005))

(declare-fun m!399007 () Bool)

(assert (=> mapNonEmpty!17229 m!399007))

(declare-fun m!399009 () Bool)

(assert (=> start!38972 m!399009))

(declare-fun m!399011 () Bool)

(assert (=> start!38972 m!399011))

(declare-fun m!399013 () Bool)

(assert (=> b!408158 m!399013))

(declare-fun m!399015 () Bool)

(assert (=> b!408156 m!399015))

(declare-fun m!399017 () Bool)

(assert (=> b!408154 m!399017))

(declare-fun m!399019 () Bool)

(assert (=> b!408153 m!399019))

(declare-fun m!399021 () Bool)

(assert (=> b!408151 m!399021))

(declare-fun m!399023 () Bool)

(assert (=> b!408155 m!399023))

(declare-fun m!399025 () Bool)

(assert (=> b!408150 m!399025))

(check-sat (not mapNonEmpty!17229) (not b!408156) (not b!408150) (not b!408151) (not b!408159) (not b!408158) (not b!408154) (not start!38972) (not b!408155) tp_is_empty!10405)
(check-sat)
